function go_cv_lstm3(floc,fname,lab,mname,gpunum,resume)
if ~exist('gpunum') fprintf('Usage: floc,fname,lab,mname,gpunum,resume\n');return;end
if ~exist('resume') resume = 0;end

f=fopen([floc '/preds/lab_' num2str(lab) '_' mname '_' fname],'w');fclose(f);
folds=1:5;
for fold=1:5
    [data1,Y1,~,maxd,maxf]=prepare_LSTMdata3([floc '/' fname],mname,folds(folds~=fold));
    [data2,Y2,users]=prepare_LSTMdata3([floc '/' fname],mname,fold);
    hdf5write([num2str(feature('getpid')) '-data.h5'],'/data1',data1','/Y1',Y1','/data2',data2','/Y2',Y2');

    if (resume)
        copyfile([floc '/preds/lab_1_' mname '_' strtok(fname,'.') '.fold' ...
                  num2str(fold) '.weights.h5'],[num2str(feature('getpid')) '-weights.h5'])
    end
    system(['./run_py.sh ' num2str(gpunum) ' eye_lstm3.py ' ...
            num2str(feature('getpid')) ' ' num2str([maxd maxf resume])]);
    movefile([num2str(feature('getpid')) '-weights.h5'],[floc '/preds/lab_' num2str(lab) '_' mname '_' strtok(fname,'.') '.fold' num2str(fold) '.weights.h5'])
    preds=load([num2str(feature('getpid')) '-pred.csv']);

    fprintf('fold %d preds %d users %d\n',fold,size(preds,1),length(unique(users)));

    actual=Y2';

    f=fopen([floc '/preds/lab_' num2str(lab) '_' mname '_' fname],'a');
    for i=1:size(preds,1)
	fprintf(f,'%.5f %d %s\n',preds(i), logical(actual(i)), users{i});end
    fclose(f);
end

d=readtable([floc '/preds/lab_' num2str(lab) '_' mname '_' fname],'ReadVariableNames',false,'Delimiter', ' ');
fprintf('Baseline RMSE: %.5f\n',sqrt(mean(( repmat(mean(d{:,2}),size(d,1),1) - d{:,2}).^2)));
fprintf('    LSTM RMSE: %.5f\n',sqrt(mean((d{:,1}-d{:,2}).^2)));
