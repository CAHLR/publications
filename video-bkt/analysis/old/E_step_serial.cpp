#include <Eigen/Core>
#include "mex.h"

using namespace Eigen;
using namespace std;

// TODO openmp version

// NOTE: mxSetProperty and possibly mxGetProperty make copies, even with
// classdef < handle! lame! I believe mxGetField does NOT make a copy, though I
// haven't tested it recently

void mexFunction( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[] )
{

    /* SETUP */
    if (nrhs != 5) { mexErrMsgTxt("wrong number of arguments\n"); }

    //// pull out inputs

    // data
    if (!mxGetField(prhs[0],0,"data")) { mexErrMsgTxt("data missing 'data' field\n"); }
    int8_t *alldata = (int8_t *) mxGetData(mxGetField(prhs[0],0,"data"));
    int bigT = mxGetN(mxGetField(prhs[0],0,"data")); // total length of the data
    int num_subparts = mxGetM(mxGetField(prhs[0],0,"data")); // number of sub-parts

    if (!mxGetField(prhs[0],0,"resources")) { mexErrMsgTxt("data missing 'resources' field\n"); }
    int8_t *allresources = (int8_t *) mxGetData(mxGetField(prhs[0],0,"resources"));

    if (!mxGetField(prhs[0],0,"starts")) { mexErrMsgTxt("data missing 'starts' field\n"); }
    int32_t *starts = (int32_t *) mxGetData(mxGetField(prhs[0],0,"starts"));
    int num_sequences = max(mxGetM(mxGetField(prhs[0],0,"starts")),
            mxGetM(mxGetField(prhs[0],0,"starts")));

    if (!mxGetField(prhs[0],0,"lengths")) { mexErrMsgTxt("data missing 'lengths' field\n"); }
    int32_t *lengths = (int32_t *) mxGetData(mxGetField(prhs[0],0,"lengths"));

    // parameters struct
    if (!mxGetField(prhs[1],0,"learns")) { mexErrMsgTxt("model missing 'learns' field\n"); }
    double *learns = mxGetPr(mxGetField(prhs[1],0,"learns"));
    int num_resources = max(mxGetM(mxGetField(prhs[1],0,"learns")),
            mxGetN(mxGetField(prhs[1],0,"learns")));

    if (!mxGetField(prhs[1],0,"forgets")) { mexErrMsgTxt("model missing 'forgets' field\n"); }
    double *forgets = mxGetPr(mxGetField(prhs[1],0,"forgets"));

    if (!mxGetField(prhs[1],0,"guesses")) { mexErrMsgTxt("model missing 'guesses' field\n"); }
    double *guess = mxGetPr(mxGetField(prhs[1],0,"guesses"));

    if (!mxGetField(prhs[1],0,"slips")) { mexErrMsgTxt("model missing 'slips' field\n"); }
    double *slip = mxGetPr(mxGetField(prhs[1],0,"slips"));

    if (!mxGetField(prhs[1],0,"prior")) { mexErrMsgTxt("model missing 'prior' field\n"); }
    double prior = mxGetScalar(mxGetField(prhs[1],0,"prior"));

    Array2d initial_distn;
    initial_distn << 1-prior, prior;

    MatrixXd As(2,2*num_resources);
    for (int n=0; n<num_resources; n++) {
        As.col(2*n) << 1-learns[n], learns[n];
        As.col(2*n+1) << forgets[n], 1-forgets[n];
    }

    Array2Xd Bn(2,2*num_subparts);
    for (int n=0; n<num_subparts; n++) {
        Bn.col(2*n) << 1-guess[n], slip[n]; // incorrect
        Bn.col(2*n+1) << guess[n], 1-slip[n]; // correct
    }

    //// outputs

    // rhs outputs
    Map<ArrayXXd,Aligned> all_trans_softcounts(mxGetPr(prhs[2]),2,2*num_resources);
    all_trans_softcounts.setZero();
    Map<Array2Xd,Aligned> all_emission_softcounts(mxGetPr(prhs[3]),2,2*num_subparts);
    all_emission_softcounts.setZero();
    Map<Array2d,Aligned> all_initial_softcounts(mxGetPr(prhs[4]));
    all_initial_softcounts.setZero();

    // lhs outputs
    Map<Array2Xd,Aligned> gamma_out(NULL,2,bigT);
    Map<Array2Xd,Aligned> alpha_out(NULL,2,bigT);
    double s_total_loglike = 0;
    double *total_loglike = &s_total_loglike;
    switch (nlhs) {
        case 3:
            plhs[2] = mxCreateDoubleMatrix(2,bigT,mxREAL);
            new (&gamma_out) Map<Array2Xd,Aligned>(mxGetPr(plhs[2]),2,bigT);
        case 2:
            plhs[1] = mxCreateDoubleMatrix(2,bigT,mxREAL);
            new (&alpha_out) Map<Array2Xd,Aligned>(mxGetPr(plhs[1]),2,bigT);
        case 1:
            plhs[0] = mxCreateDoubleScalar(0.);
            total_loglike = mxGetPr(plhs[0]);
    }

    /* COMPUTATION */

    for (int sequence_index=0; sequence_index < num_sequences; sequence_index++) {
        // NOTE: -1 because Matlab indexing starts at 1
        int32_t sequence_start = starts[sequence_index] - 1;
        int32_t T = lengths[sequence_index];

        int8_t *data = alldata + num_subparts*sequence_start;
        int8_t *resources = allresources + sequence_start;

        //// likelihoods
        Array2Xd likelihoods(2,T);
        likelihoods.setOnes();
        for (int t=0; t<T; t++) {
            for (int n=0; n<num_subparts; n++) {
                if (data[n+num_subparts*t] != 0) {
                    likelihoods.col(t) *= Bn.col(2*n + (data[n+num_subparts*t] == 2));
                }
            }
        }

        //// forward messages
        double loglike, norm;
        MatrixXd alpha(2,T);
        alpha.col(0) = initial_distn * likelihoods.col(0);
        norm = alpha.col(0).sum();
        alpha.col(0) /= norm;
        loglike = log(norm);
        for (int t=0; t<T-1; t++) {
            alpha.col(t+1) = (As.block(0,2*(resources[t]-1),2,2) * alpha.col(t)).array()
                * likelihoods.col(t+1);
            norm = alpha.col(t+1).sum();
            alpha.col(t+1) /= norm;
            loglike += log(norm);
        }

        //// backward messages and statistic counting
        ArrayXXd trans_softcounts(2,2*num_resources);
        trans_softcounts.setZero();
        Array2Xd emission_softcounts(2,2*num_subparts);
        emission_softcounts.setZero();
        Array2d init_softcounts; // no need to set zero

        Array2Xd gamma(2,T);
        gamma.col(T-1) = alpha.col(T-1);
        for (int n=0; n<num_subparts; n++) {
            if (data[n+num_subparts*(T-1)] != 0) {
                emission_softcounts.col(2*n + (data[n+num_subparts*(T-1)] == 2)) += gamma.col(T-1);
            }
        }
        for (int t=T-2; t>=0; t--) {
            Matrix2d A = As.block(0,2*(resources[t]-1),2,2);
            Array22d pair = A;
            pair.rowwise() *= alpha.col(t).transpose().array();
            pair.colwise() *= gamma.col(t+1);
            pair.colwise() /= (A*alpha.col(t)).array();

            trans_softcounts.block(0,2*(resources[t]-1),2,2) += pair;

            gamma.col(t) = pair.colwise().sum().transpose();
            // NOTE: we have to touch the data again here
            for (int n=0; n<num_subparts; n++) {
                if (data[n+num_subparts*t] != 0) {
                    emission_softcounts.col(2*n + (data[n+num_subparts*t] == 2)) += gamma.col(t);
                }
            }
        }
        init_softcounts = gamma.col(0);

        // NOTE: these will need to change to base types for openmp
        all_trans_softcounts += trans_softcounts;
        all_emission_softcounts += emission_softcounts;
        all_initial_softcounts += init_softcounts;

        switch (nlhs) {
            case 3:
                gamma_out.block(0,sequence_start,2,T) = gamma;
            case 2:
                alpha_out.block(0,sequence_start,2,T) = alpha;
            case 1:
                *total_loglike += loglike;
        }

    }
}

