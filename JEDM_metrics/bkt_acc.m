function err = bkt_acc(data, params)
  if (params(1) < 0 || params(2) < 0 || params(3) < 0 || params(4) < 0 || params(1) > 1 || params(2) > 1 || params(3) > 1 || params(4) > 1)
    err = Inf
    else

      pred_reshape = predict(data,params(1),params(2),params(3),params(4));
[err1, err2, err] = precision_recall(data, pred_reshape);
err = -err;
end
