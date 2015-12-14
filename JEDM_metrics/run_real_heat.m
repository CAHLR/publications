function run_real_heat()
addpath(genpath('../../MLE-hmm'));

grid_search_heatmap('datasets/real5/assistments_adding_sub_fractions.csv','out/real5/assistments_adding_sub_fractions_heat.csv',0.48,0.26);
grid_search_heatmap('datasets/real5/assistments_area_circle.csv','out/real5/assistments_area_circle_heat.csv',0.4,0.22);
grid_search_heatmap('datasets/real5/cogtutor_fractions_calc_lcd.csv','out/real5/cogtutor_fractions_calc_lcd_heat.csv',0.08,0.54);
grid_search_heatmap('datasets/real5/cogtutor_area_circle.csv','out/real5/cogtutor_area_circle_heat.csv',0.2,0.14);
grid_search_heatmap('datasets/real5/khan_adding_sub_fractions.csv','out/real5/khan_adding_sub_fractions_heat.csv',0.66,0.2);
grid_search_heatmap('datasets/real5/khan_area_circle.csv','out/real5/khan_area_circle_heat.csv',0.22,0.06);


grid_search_heatmap('datasets/real8/assistments_adding_sub_fractions.csv','out/real8/assistments_adding_sub_fractions_heat.csv',0.4,0.18);
grid_search_heatmap('datasets/real8/assistments_area_circle.csv','out/real8/assistments_area_circle_heat.csv',0.4,0.14);
grid_search_heatmap('datasets/real8/cogtutor_fractions_calc_lcd.csv','out/real8/cogtutor_fractions_calc_lcd_heat.csv',0.02,0.34);
grid_search_heatmap('datasets/real8/cogtutor_area_circle.csv','out/real8/cogtutor_area_circle_heat.csv',0.24,0.18);
grid_search_heatmap('datasets/real8/khan_adding_sub_fractions.csv','out/real8/khan_adding_sub_fractions_heat.csv',0.24,0.04);
grid_search_heatmap('datasets/real8/khan_area_circle.csv','out/real8/khan_area_circle_heat.csv',0.26,0.06);


