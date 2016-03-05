% Zach Pardos (zp@berkeley.edu)
% Computational Approaches to Human Learning (CAHL) Lab

function [data, resp, users, maxd2, maxf] = prepare_LSTM3(fname,mname,flds)
if isempty(strfind(path,'xBKT')),addpath(genpath('~/xBKT'));end
% this file differs from LSTMdata by having a one hot encoding instead of indexed
% vector: [1-is_log] [2-problem+AOI] [3-correct]
if ~exist('flds'), flds=1:5;end
logonly=isempty(findstr(strtok(fname,'/'),'eye'));
D = readtable(fname);
D.islog = strcmp(D.eyeHeader,'log');
if logonly D=D(D.islog,:);end
D.Vec1 = D.islog;
D.Vec2 = dummyvar(grp2idx([num2str(D.problem) repmat('-',size(D,1),1) char(D.AOI_withPT)]));
D.Vec3 = repmat([0 0],size(D,1),1);
if logonly D.Vec2=dummyvar(grp2idx(D.problem));end
D.Vec3(D.islog,:) = [strcmp(D.Outcome(D.islog),'INCORRECT') strcmp(D.Outcome(D.islog),'CORRECT')];
D.Action=int8([D.Vec1 D.Vec2 D.Vec3]);
maxf = size(D.Action,2);
medeye = round(median(accumarray(grp2idx(D.Subject(~D.islog)),1)));
if isnan(medeye) medeye = 0;end
maxlog = max(accumarray(grp2idx(D.Subject(D.islog)),1));
maxd2 = (medeye+maxlog)*maxf;
maxd = max(accumarray(grp2idx(D.Subject),1));

folds=readtable('fold_assignment.csv');
D=D(ismember(D.Subject,folds.Subject(ismember(folds.Fold,flds))),:);

resp = D.Vec3(D.islog,2)';
users = unique(D.Subject);
data = int8(zeros(maxd*maxf,length(users)));
i=1;u=1;
fprintf('Loading users:\n');
for usr = users'
 uD = D(strcmp(D.Subject,usr),:);
 islog=strcmp(uD.eyeHeader,'log');
 logs = find(islog==1);
 for l = 1:length(logs)
	actions=uD.Action(1:logs(l)-1,:)';
	actions=[actions [uD.Action(logs(l),1:end-2)';0;0]];
   	data(maxd*maxf-length(actions(:))+1:maxd*maxf,i)=actions(:);
	i=i+1;
 end
 util.print_dot(u,length(users),length(users))
 u = u +1;
end
data=data';
data=data(:,end-maxd2+1:end);
users = D{D.islog,'Subject'};
