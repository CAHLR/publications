function err = bkt_auc(data, params)
  if (params(1) < 0 || params(2) < 0 || params(3) < 0 || params(4) < 0 || params(1) > 1 || params(2) > 1 || params(3) > 1 || params(4) > 1)
    err = Inf
    else

      pred_reshape = predict(data,params(1),params(2),params(3),params(4));
[students,questions]=size(data);
data_onerow = reshape(data',1,students*questions);
pred = reshape(pred_reshape',1,students*questions);
[err, err2] = auc(data_onerow, pred);
err = -err;
end
