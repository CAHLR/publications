function ll = loglik(actual,pred)

  ll = 0;
for s=1:size(actual,1)
	prod = 1.0;
for r=1:size(actual,2) 
	if actual(s,r) == 1 % actual response
	prod = prod*pred(s,r);
	else
	  prod = prod*(1-pred(s,r));
   end
  end
   ll = ll + log(prod); % We use + here because log of product is sum of log (i.e. log(a*b*c) = log(a) + log(b) + log(c))
end
