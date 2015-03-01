function [p,l,g,s] = search_ll_em(data,init)

max_fval = -Inf;
max_ret = NaN;
ret_all = [];
val_all = [];

for i=1:size(init,1)
m = generate.random_model_uni(1,1);
m.prior = init(i,1);
m.learns = init(i,2);
m.guesses = init(i,3);
m.slips = init(i,4);

[students,questions]=size(data);
data_onerow = reshape(data',1,students*questions);
d=struct;
d.stateseqs=int8(ones(1,students*questions));
dataT=data';                                                                  
d.data=int8(dataT(:)'+1); % A(:) converts a matrix A to a vector column-wise
d.lengths=int32(questions*ones(students,1));
d.starts=int32(cumsum(d.lengths)-(questions-1));
d.resources=int16(ones(1,students*questions));

[model,ll] = fit.EM_fit(m,d,1e-8,1000);

ret_all = [ret_all;[model.prior model.learns model.guesses model.slips]];
val_all = [val_all;ll(size(ll,1))];

        if (ll(size(ll,1)) > max_fval)
          max_fval = ll(size(ll,1));
          max_ret = [model.prior model.learns model.guesses model.slips];
        end

end

p = max_ret(1);
l = max_ret(2);
g = max_ret(3);
s = max_ret(4);
dlmwrite('26_em_param.csv',ret_all);
dlmwrite('26_em_val.csv',val_all);

