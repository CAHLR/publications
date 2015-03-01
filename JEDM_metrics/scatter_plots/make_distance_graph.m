function[] = make_distance_graph(prior,learn,guess,slip,dataset)

	data = csvread(dataset);
    %0,0,[0,0,100,5]
	d_p = (data(:,1)-prior).^2;
	d_l = (data(:,2)-learn).^2;
	d_g = (data(:,3)-guess).^2;
	d_s = (data(:,4)-slip).^2;
    d = sqrt(d_p + d_l + d_g + d_s);
    
    subplot(1,6,1);
 	scatter(d,data(:,5),20);
    title('Distance vs LL','FontSize', 21); 
    xlabel('Distance','FontSize', 21); 
    ylabel('LL','FontSize', 21);
     
    subplot(1,6,2);
	scatter(d,data(:,6),21);
    title('Distance vs -RMSE','FontSize', 21);
    xlabel('Distance', 'FontSize', 21);
    ylabel('-RMSE','FontSize', 21);

    subplot(1,6,3);
 	scatter(d,data(:,8),20);
    title('Distance vs AUC','FontSize', 21); 
    xlabel('Distance','FontSize', 21); 
    ylabel('AUC','FontSize', 21);
     
    subplot(1,6,4);
	scatter(d,data(:,10),21);
    title('Distance vs Precision','FontSize', 21);
    xlabel('Distance', 'FontSize', 21);
    ylabel('Precision','FontSize', 21);
    
subplot(1,6,5);
scatter(d,data(:,11),21);
    title('Distance vs Recall','FontSize', 21);
    xlabel('Distance','FontSize', 21);
    ylabel('Recall','FontSize', 21);

    subplot(1,6,6);
    g=scatter(d,data(:,12),21);
    title('Distance vs Accuracy','FontSize', 21);
    xlabel('Distance','FontSize', 21);
    ylabel('Accuracy','FontSize', 21);

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 60 20]);
saveas(gcf,'26','png');
