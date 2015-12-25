function run_real_heat()
addpath(genpath('../../MLE-hmm'));

grid_search_heatmap('datasets/real5/assistments_exponents.csv','out/real5/assistments_exponents_heat.csv',0.43522,0.28394)
grid_search_heatmap('datasets/real5/cogtutor_exponents_2.csv','out/real5/cogtutor_exponents_2_heat.csv',0.95744,0.18726)
grid_search_heatmap('datasets/real5/khan_exponents_2.csv','out/real5/khan_exponents_2_heat.csv',0.36684,0.087734)

%grid_search_heatmap('datasets/real5/assistments_adding_sub_fractions.csv','out/real5/assistments_adding_sub_fractions_heat.csv',0.4,0.18);
%grid_search_heatmap('datasets/real5/assistments_area_circle.csv','out/real5/assistments_area_circle_heat.csv',0.4,0.22);
%grid_search_heatmap('datasets/real5/cogtutor_fractions_calc_lcd.csv','out/real5/cogtutor_fractions_calc_lcd_heat.csv',0.08,0.54);
%grid_search_heatmap('datasets/real5/cogtutor_area_circle.csv','out/real5/cogtutor_area_circle_heat.csv',0.2,0.14);
%grid_search_heatmap('datasets/real5/khan_adding_sub_fractions.csv','out/real5/khan_adding_sub_fractions_heat.csv',0.66,0.2);
%grid_search_heatmap('datasets/real5/khan_area_circle.csv','out/real5/khan_area_circle_heat.csv',0.22,0.06);


