function grid_search_small(data,out,prior,learn,guess,slip)
d = 0.02; 
n = 11;
colnames = {'prior' 'learn' 'guess' 'slip' 'll' 'rmse' };    
result_mat = zeros(n^4,12);
r = 1;

prior_i=prior-0.1;
learn_i=learn-0.1;
guess_i=guess-0.1;
slip_i=slip-0.1;

if (prior_i<0)
  prior_i = prior - floor(prior/d)*d;
end
if (learn_i<0)
  learn_i = learn - floor(learn/d)*d;
end
if (guess_i<0)
  guess_i = guess - floor(guess/d)*d;
end
if (slip_i<0)
  slip_i = slip - floor(slip/d)*d;
end

for p=prior_i:d:prior+0.1
 for l=learn_i:d:learn+0.1
   for g=guess_i:d:guess+0.1
     for s=slip_i:d:slip+0.1
        
        fprintf('p=%.4f,l=%.4f,g=%.4f,s=%.4f\n',p,l,g,s);
        result_mat(r,1) = p;
        result_mat(r,2) = l;
        result_mat(r,3) = g;
        result_mat(r,4) = s;
        [ll,rmse1,rmse2,auc1,auc2,prec,recall,acc] = bkt_ll_rmse_fast(data,p,l,g,s);
        result_mat(r,5) = ll;
        result_mat(r,6) = rmse1;
        result_mat(r,7) = rmse2;
        result_mat(r,8) = auc1;
        result_mat(r,9) = auc2;   
        result_mat(r,10) = prec;  
        result_mat(r,11) = recall; 
        result_mat(r,12) = acc;

        r = r+1;
     end    
   end  
 end   
end    

dlmwrite(out,result_mat([1:r-1],:));
