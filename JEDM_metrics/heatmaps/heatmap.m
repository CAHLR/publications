function heatmap(result_data,d,title_ll,title_rmse,title_auc,title_prec,title_recall,title_accur,guess,slip)
orgmap = colormap;
newmap = colormap;
newmap(1,:) = [0,0,0];

data_heat=load(result_data);
n = floor(1/d)-1;
M_ll=reshape(data_heat(:,5),n,n);
M_rmse=reshape(data_heat(:,6),n,n);
M_auc=reshape(data_heat(:,8),n,n);
M_prec=reshape(data_heat(:,10),n,n);
M_recall=reshape(data_heat(:,11),n,n);
M_accur=reshape(data_heat(:,12),n,n);
M_ll=-M_ll;
M_rmse=-M_rmse;
M_auc=-M_auc;
M_prec=-M_prec;
M_recall=-M_recall;
M_accur=-M_accur;

if (existnan(M_ll)) 
  colormap(newmap);
M_ll(isnan(M_ll))=nan_val(M_ll);
 else
   colormap(orgmap);
end
image([0.02 0.98], [0.02 0.98],M_ll,'CDataMapping', 'scaled');
set(gca,'YDir','normal');
hold on;
%title('Log-likelihood','FontSize',25)
%xlabel('Guess','FontSize',25)
%ylabel('Slip','FontSize',25)
set(gca, 'XTick', [], 'XTickLabel', []);
set(gca, 'YTick', [], 'YTickLabel', []);
a=scatter(guess,slip,200,'filled','white');
hold off;
saveas(a, title_ll,'png');

if (existnan(M_rmse)) 
  colormap(newmap);
M_rmse(isnan(M_rmse))=nan_val(M_rmse);
 else
   colormap(orgmap);
end
image([0.02 0.98], [0.02 0.98],M_rmse,'CDataMapping', 'scaled');
set(gca,'YDir','normal');
hold on;
%title('-RMSE','FontSize',25)
%xlabel('Guess','FontSize',25)
%ylabel('Slip','FontSize',25)
set(gca, 'XTick', [], 'XTickLabel', []);
set(gca, 'YTick', [], 'YTickLabel', []);
b=scatter(guess,slip,200,'filled','white');
hold off;
saveas(b, title_rmse,'png');

if (existnan(M_auc)) 
  colormap(newmap);
M_auc(isnan(M_auc))=nan_val(M_auc);
 else
   colormap(orgmap);
end
image([0.02 0.98], [0.02 0.98],M_auc,'CDataMapping', 'scaled');
set(gca,'YDir','normal');
hold on;
%title('AUC','FontSize',25)
%xlabel('Guess','FontSize',25)
%ylabel('Slip','FontSize',25)
set(gca, 'XTick', [], 'XTickLabel', []);
set(gca, 'YTick', [], 'YTickLabel', []);
c=scatter(guess,slip,200,'filled','white');
hold off;
saveas(c, title_auc,'png');

if (existnan(M_prec)) 
  colormap(newmap);
M_prec(isnan(M_prec))=nan_val(M_prec);
 else
   colormap(orgmap);
end
image([0.02 0.98], [0.02 0.98],M_prec,'CDataMapping', 'scaled');
set(gca,'YDir','normal');
hold on;
%title('Precision','FontSize',25)
%xlabel('Guess','FontSize',25)
%ylabel('Slip','FontSize',25)
set(gca, 'XTick', [], 'XTickLabel', []);
set(gca, 'YTick', [], 'YTickLabel', []);
d=scatter(guess,slip,200,'filled','white');
hold off;
saveas(d, title_prec,'png');

if (existnan(M_recall)) 
  colormap(newmap);
M_recall(isnan(M_recall))=nan_val(M_recall);
 else
   colormap(orgmap);
end
image([0.02 0.98], [0.02 0.98],M_recall,'CDataMapping', 'scaled');
set(gca,'YDir','normal');
hold on;
%title('Recall','FontSize',25)
%xlabel('Guess','FontSize',25)
%ylabel('Slip','FontSize',25)
set(gca, 'XTick', [], 'XTickLabel', []);
set(gca, 'YTick', [], 'YTickLabel', []);
e=scatter(guess,slip,200,'filled','white');
hold off;
saveas(e, title_recall,'png');

if (existnan(M_accur)) 
  colormap(newmap);
M_accur(isnan(M_accur))=nan_val(M_accur);
 else
   colormap(orgmap);
end
image([0.02 0.98], [0.02 0.98],M_accur,'CDataMapping', 'scaled');
set(gca,'YDir','normal');
hold on;
%title('Accuracy','FontSize',25)
%xlabel('Guess','FontSize',25)
%ylabel('Slip','FontSize',25)
set(gca, 'XTick', [], 'XTickLabel', []);
set(gca, 'YTick', [], 'YTickLabel', []);
f=scatter(guess,slip,200,'filled','white');
hold off;
saveas(f, title_accur,'png');
