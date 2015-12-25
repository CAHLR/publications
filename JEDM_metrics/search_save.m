function search_save(file,outfile)
disp(file);
data = load(file);
init=[
      0.2492    0.4799    0.1702    0.2926;
       0.2238    0.1493    0.2511    0.7572;
       0.7513    0.2575    0.6160    0.7537;
       0.2551    0.8407    0.4733    0.3804;
       0.5060    0.2543    0.3517    0.5678;
       0.6991    0.8143    0.8308    0.0759;
       0.8909    0.2435    0.5853    0.0540;
       0.9593    0.9293    0.5497    0.5308;
       0.5472    0.3500    0.9172    0.7792;
       0.1386    0.1966    0.2858    0.9340;
      ];
result = zeros(6,4);

result(1,:) = search_xxx(data,init,@(data,init) bkt_ll(data,init));
result(2,:) = search_xxx(data,init,@(data,init) bkt_rmse(data,init));
result(3,:) = search_xxx(data,init,@(data,init) bkt_auc(data,init));
result(4,:) = search_xxx(data,init,@(data,init) bkt_prec(data,init));
result(5,:) = search_xxx(data,init,@(data,init) bkt_recall(data,init));
result(6,:) = search_xxx(data,init,@(data,init) bkt_acc(data,init));

dlmwrite(outfile,result);
end
