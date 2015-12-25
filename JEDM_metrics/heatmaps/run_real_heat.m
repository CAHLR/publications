function run_real_heat()

dir = '../out/real5/'

%for str = {'assistments_adding_sub_fractions','assistments_area_circle','cogtutor_fractions_calc_lcd','cogtutor_area_circle','khan_adding_sub_fractions','khan_area_circle'}
for str = {'assistments_exponents','cogtutor_exponents_2','khan_exponents_2'}
  pre = strcat(dir,str{1})
  heatmap(strcat(pre,'_heat.csv'),0.02,strcat(pre,'_heat_ll.png'),strcat(pre,'_heat_rmse.png'),strcat(pre,'_heat_auc.png'),strcat(pre,'_heat_precision.png'),strcat(pre,'_heat_recall.png'),strcat(pre,'_heat_accuracy.png'),0,0);
end

