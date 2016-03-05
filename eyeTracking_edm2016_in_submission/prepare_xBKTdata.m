% Zach Pardos (zp@berkeley.edu)
% Computational Approaches to Human Learning (CAHL) Lab

function [data,users] = prepare_xBKTeyedata(floc,fname,mname,flds)
if ~exist('flds'), flds=1:5;end
fname=strrep(fname,'.txt','');

D = readtable([floc '/' fname]);
D.islog = strcmp(D.eyeHeader,'log');
if isempty(findstr(floc,'eye'))
   D=D(D.islog,:);
   D.Actions = repmat('answer',size(D,1),1);
else
   D.Actions = strcat([num2str(D.problem(1:end)) repmat('-',size(D,1),1) char(D.AOI_withPT(1:end))]);
   D.Actions(D.islog,:) = [repmat('answer',sum(D.islog),1) repmat(' ',sum(D.islog),size(D.Actions,2)-length('answer'))];
end

[D.Action,data.actions] = grp2idx(D.Actions);
if length(flds)==5,f=fopen([floc '/preds/' mname '_' fname '.actions'],'w');fprintf(f,'%s\n',data.actions{:});fclose(f);end
if strcmp(mname,'basic'), D.eclass=ones(size(D,1),1);else D.eclass=grp2idx(D.(mname));end
max_eclass=max(D.eclass);
folds=readtable('fold_assignment.csv');
D=D(ismember(D.Subject,folds.Subject(ismember(folds.Fold,flds))),:);

data.data=strcmp(D.Outcome,'CORRECT')'*2;
data.data(strcmp(D.Outcome,'INCORRECT')) = 1;
data2=zeros(max_eclass,size(data.data,2));
for d=find(data.data>0),data2(D.eclass(d),d)=data.data(d);end
data.data=int8(data2);

[a,subj_id]=ismember(D.Subject,folds.Subject);
data.starts=int32(find([1;diff(subj_id)~=0]==1));
data.lengths=int32(diff([data.starts;size(data.data,2)+1]));
data.resources=int16(D.Action');
users=table2array(D(D.islog,'Subject'));
