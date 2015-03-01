function [p,l,g,s] = search_rmse(data,init)
  options = optimset('TolX',1e-6);
min_fval = Inf;
min_ret = NaN;
ret_all = [];
val_all = [];

for i=1:size(init,1)
        [ret,fval,exitflag,output] = fminsearch(@(v) bkt_rmse(data, v), init(i,:),options);
        
        ret_all = [ret_all;ret];
val_all = [val_all;fval];
        if (fval < min_fval)
          min_fval = fval;
          min_ret = ret;
        end
end

p = min_ret(1);
l = min_ret(2);
g = min_ret(3);
s = min_ret(4);
dlmwrite('26_rmse_param.csv',ret_all);
dlmwrite('26_rmse_val.csv',val_all);

