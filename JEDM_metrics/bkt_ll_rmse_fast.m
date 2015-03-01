function [ll,rmse1,rmse2,auc1,auc2,prec,recall,acc] = bkt_ll_rmse_fast(file, prior, learn, guess, slip)

data = load(file);

m = generate.random_model_uni(1,1);
m.prior = prior;
m.learns = learn;
m.guesses = guess;
m.slips = slip;

[students,questions]=size(data);
%d = generate.synthetic_data(m,ones(1,size(raw_data,1))*size(raw_data,2));
data_onerow = reshape(data',1,students*questions);
d=struct;
d.stateseqs=int8(ones(1,students*questions));
dataT=data';                                                                  
d.data=int8(dataT(:)'+1); % A(:) converts a matrix A to a vector column-wise
d.lengths=int32(questions*ones(students,1));
d.starts=int32(cumsum(d.lengths)-(questions-1));
d.resources=int16(ones(1,students*questions));

[pred,state] = fit.predict_onestep(m,d);
pred_reshape = reshape(pred,questions,students)';

            %data_f = data(sum(isnan(pred_reshape'))==0,:);
            %pred_reshape_f = pred_reshape(sum(isnan(pred_reshape'))==0,:);

	    %dlmwrite('out/17_filtered.csv',data_f);
	    %dlmwrite('out/17_pred_filtered.csv',pred_reshape_f);

	    %[students_f,questions_f]=size(data_f);
%data_onerow_f = reshape(data_f',1,students_f*questions_f);
%pred_f = reshape(pred_reshape_f',1,students_f*questions_f);

ll = loglik(data,pred_reshape);
[rmse1,rmse2] = rmse(data,pred_reshape);
	    rmse1 = -rmse1;
	    rmse2 = -rmse2;
[auc1,auc2] = auc(data_onerow,pred);
[prec,recall,acc] = precision_recall(data,pred_reshape);
