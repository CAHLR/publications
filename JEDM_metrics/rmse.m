function [err,err2] = rmse(actual,pred)

sum = 0;
sum2 = 0;
for s=1:size(actual,1)
  for r=1:size(actual,2)
	  e = actual(s,r)-pred(s,r);
    sum = sum + e^2;  
    e2 = actual(s,r)-round(pred(s,r));
    sum2 = sum2 + e2^2;
  end
end
  err = sqrt(sum/(size(actual,1)*size(actual,2)));
err2 = sqrt(sum2/(size(actual,1)*size(actual,2)));
