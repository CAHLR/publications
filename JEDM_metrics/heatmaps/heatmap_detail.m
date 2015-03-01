function heatmap_detail(result_data,d,title_em,title_ll,title_rmse,input_em,input_ll,input_rmse,guess,slip,type)
orgmap = colormap;
newmap = colormap;
newmap(1,:) = [0,0,0];

data_heat=load(result_data);
n = floor(1/d)-1;
M_ll=reshape(data_heat(:,5),n,n);
M_rmse=reshape(data_heat(:,6),n,n);
M_ll=-M_ll;
M_rmse=-M_rmse;

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
param_em=load(strcat('details/',input_em));
param_ll=load(strcat('details/',input_ll));
param_rmse=load(strcat('details/',input_rmse));
if (type==0)
  one=3;
two=4;
 else
   one=1;
two=3;
end

L0=linspace(0,0.898,100);
G=0.265+rdivide(0.075,(1-L0)); %dataset 11
%G=0.4-rdivide(0.051,(1-L0)); %dataset 26

%%%%%%%%%%%%%%%%%%%%%% EM %%%%%%%%%%%%%%%%%%%%%%%%%%
if (existnan(M_ll)) 
  colormap(newmap);
M_ll(isnan(M_ll))=nan_val(M_ll);
 else
   colormap(orgmap);
end
image([0 1], [0 1],M_ll,'CDataMapping', 'scaled');
set(gca,'YDir','normal');
hold on;
%title('Log-likelihood','FontSize',25)

if (type==0)
  xlabel('Guess','FontSize',25);
ylabel('Slip','FontSize',25);
else
  xlabel('Prior','FontSize',25);
ylabel('Guess','FontSize',25);
end

a=plot(L0,G,'cyan');
for i=1:10
        a=plot([init(i,one) param_em(i,one)],[init(i,two) param_em(i,two)],'black');
a=scatter(init(i,one),init(i,two),'filled','black');
a=scatter(param_em(i,one),param_em(i,two),'filled','magenta');
end

a=scatter(param_em(11,one),param_em(11,two),100,'filled','red');
a=scatter(guess,slip,100,'filled','white');
hold off;
saveas(a, title_em,'png');

%%%%%%%%%%%%%%%%%%%%%% LL %%%%%%%%%%%%%%%%%%%%%%%%%%
if (existnan(M_ll)) 
  colormap(newmap);
M_ll(isnan(M_ll))=nan_val(M_ll);
 else
   colormap(orgmap);
end
image([0 1], [0 1],M_ll,'CDataMapping', 'scaled');
set(gca,'YDir','normal');
hold on;
%title('Log-likelihood','FontSize',25)

if (type==0)
  xlabel('Guess','FontSize',25);
ylabel('Slip','FontSize',25);
else
  xlabel('Prior','FontSize',25);
ylabel('Guess','FontSize',25);
end

a=plot(L0,G,'cyan');

for i=1:10
        a=plot([init(i,one) param_ll(i,one)],[init(i,two) param_ll(i,two)],'black');
a=scatter(init(i,one),init(i,two),'filled','black');
a=scatter(param_ll(i,one),param_ll(i,two),'filled','magenta');
end

a=scatter(param_ll(11,one),param_ll(11,two),100,'filled','red');
a=scatter(guess,slip,100,'filled','white');

hold off;
saveas(a, title_ll,'png');

%%%%%%%%%%%%%%%%%%%%%% RMSE %%%%%%%%%%%%%%%%%%%%%%%%%%
if (existnan(M_rmse)) 
  colormap(newmap);
M_rmse(isnan(M_rmse))=nan_val(M_rmse);
 else
   colormap(orgmap);
end
image([0 1], [0 1],M_rmse,'CDataMapping', 'scaled');
set(gca,'YDir','normal');
hold on;
%title('-RMSE','FontSize',25)

if (type==0)
  xlabel('Guess','FontSize',25);
ylabel('Slip','FontSize',25);
else
  xlabel('Prior','FontSize',25);
ylabel('Guess','FontSize',25);
end

a=plot(L0,G,'cyan');

for i=1:10
        a=plot([init(i,one) param_rmse(i,one)],[init(i,two) param_rmse(i,two)],'black');
a=scatter(init(i,one),init(i,two),'filled','black');
a=scatter(param_rmse(i,one),param_rmse(i,two),'filled','magenta');
end

a=scatter(param_rmse(11,one),param_rmse(11,two),100,'filled','red');
a=scatter(guess,slip,100,'filled','white');

hold off;
saveas(a, title_rmse,'png');
