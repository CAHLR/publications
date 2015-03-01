function v = nan_val(M)
x=reshape(M,1,size(M,1)*size(M,2));
x_min=min(x);
x_max=max(x);
step=(x_max-x_min)/32;
v=x_min-step;
