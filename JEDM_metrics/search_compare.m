function [d1,d2,d3] = search_compare(prior,learn,guess,slip,file)
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

[p,l,g,s] = search_ll_em(data,init);
  d1 = (prior-p)*(prior-p) + (learn-l)*(learn-l) + (guess-g)*(guess-g) + (slip-s)*(slip-s);
  em=[p l g s]; 
[p,l,g,s] = search_ll(data,init);
  d2 = (prior-p)*(prior-p) + (learn-l)*(learn-l) + (guess-g)*(guess-g) + (slip-s)*(slip-s);
ll=[p l g s];
[p,l,g,s] = search_rmse(data,init);
  d3 = (prior-p)*(prior-p) + (learn-l)*(learn-l) + (guess-g)*(guess-g) + (slip-s)*(slip-s);
rmse=[p l g s];

disp('EM');
disp(em);
disp('LL');
disp(ll);
disp('RMSE');
disp(rmse);

%{
d1 = 0;

[p,l,g,s] = search_x(data,init,@(data,init) bkt_auc(data,init));
  d2 = (prior-p)*(prior-p) + (learn-l)*(learn-l) + (guess-g)*(guess-g) + (slip-s)*(slip-s);

[p,l,g,s] = search_x(data,init,@(data,init) bkt_acc(data,init));
  d3 = (prior-p)*(prior-p) + (learn-l)*(learn-l) + (guess-g)*(guess-g) + (slip-s)*(slip-s);
  %}
