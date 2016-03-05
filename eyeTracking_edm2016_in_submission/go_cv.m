% Zach Pardos (zp@berkeley.edu)
% Computational Approaches to Human Learning (CAHL) Lab

function go_cv(floc,fname,mname)
addpath(genpath('~/xBKT'));

f=fopen([floc '/preds/' mname '_' fname],'w');fclose(f);
folds=1:5;
for fold=1:5
    data=prepare_xBKTdata(floc,fname,mname,folds(folds~=fold));
    model=fit_xBKTmodel(data)
    [data, users]=prepare_xBKTdata(floc,fname,mname,fold);

    preds=fit.predict_onestep(model,data);
    preds=preds(data.data~=0);

    fprintf('fold %d preds %d users %d\n',fold,length(preds),length(unique(users)));

    actual=data.data(data.data~=0)-1;
    if size(actual,1) == 1, actual=actual';end

    f=fopen([floc '/preds/' mname '_' fname],'a');
    for i=1:length(preds)
	fprintf(f,'%.5f %d %s\n',preds(i), logical(actual(i)), users{i});end
    fclose(f);
    save([floc '/preds/' mname '_' fname 'f' num2str(fold) '.mat'],'model');
end
