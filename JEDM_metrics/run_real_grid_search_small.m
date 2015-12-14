function run_real_grid_search_samll()
addpath(genpath('../../MLE-hmm'));

grid_search_small('datasets/real5/assistments_adding_sub_fractions.csv','out/real5/assistments_adding_sub_fractions_small.csv',0.4,0.2,0.1,0.2);
grid_search_small('datasets/real5/assistments_area_circle.csv','out/real5/assistments_area_circle_small.csv',0.3,0.2,0.1,0.2);
grid_search_small('datasets/real5/cogtutor_fractions_calc_lcd.csv','out/real5/cogtutor_fractions_calc_lcd_small.csv',0.1,0.5,0.1,0.1);
grid_search_small('datasets/real5/cogtutor_area_circle.csv','out/real5/cogtutor_area_circle_small.csv',0.3,0.2,0.4,0.1);
grid_search_small('datasets/real5/khan_adding_sub_fractions.csv','out/real5/khan_adding_sub_fractions_small.csv',0.7,0.1,0.9,0.9);
grid_search_small('datasets/real5/khan_area_circle.csv','out/real5/khan_area_circle_small.csv',0.2,0.1,0.1,0.1);


grid_search_small('datasets/real8/assistments_adding_sub_fractions.csv','out/real8/assistments_adding_sub_fractions_small.csv',0.3,0.2,0.1,0.3);
grid_search_small('datasets/real8/assistments_area_circle.csv','out/real8/assistments_area_circle_small.csv',0.4,0.1,0.1,0.4);
grid_search_small('datasets/real8/cogtutor_fractions_calc_lcd.csv','out/real8/cogtutor_fractions_calc_lcd_small.csv',0.1,0.3,0.2,0.1);
grid_search_small('datasets/real8/cogtutor_area_circle.csv','out/real8/cogtutor_area_circle_small.csv',0.3,0.2,0.4,0.1);
grid_search_small('datasets/real8/khan_adding_sub_fractions.csv','out/real8/khan_adding_sub_fractions_small.csv',0.2,0.1,0.1,0.2);
grid_search_small('datasets/real8/khan_area_circle.csv','out/real8/khan_area_circle_small.csv',0.2,0.1,0.1,0.1);


