function [p,l,g,s] = search_x(data,init,f)
  options = optimset('TolX',1e-6);
min_fval = Inf;
min_ret = NaN;

for i=1:size(init,1)
        [ret,fval,exitflag,output] = fminsearch(@(v) f(data, v), init(i,:),options)
        if (fval < min_fval)
          min_fval = fval;
          min_ret = ret;
        end
end

p = min_ret(1);
l = min_ret(2);
g = min_ret(3);
s = min_ret(4);

