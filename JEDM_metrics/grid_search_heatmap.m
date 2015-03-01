function grid_search_heatmap(data,out,p,l)
d = 0.02; 
n = floor(1/d)-1;
colnames = {'prior' 'learn' 'guess' 'slip' 'll' 'rmse' };    
result_mat = zeros(n^2,12);
r = 1;

   for g=d:d:1-d
     for s=d:d:1-d
        fprintf('p=%.2f,l=%.2f,g=%.2f,s=%.2f\n',p,l,g,s);
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

dlmwrite(out,result_mat);
