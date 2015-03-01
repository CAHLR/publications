function v = existnan(M)
x=reshape(M,1,size(M,1)*size(M,2));
v=max(isnan(x));
