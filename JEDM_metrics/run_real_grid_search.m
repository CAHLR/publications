function run_real_grid_search()
addpath(genpath('../../MLE-hmm'));

%grid_search('datasets/real5/assistments_adding_sub_fractions.csv','out/real5/assistments_adding_sub_fractions.csv');
%grid_search('datasets/real5/assistments_area_circle.csv','out/real5/assistments_area_circle.csv');
grid_search('datasets/real5/cogtutor_fractions_calc_lcd.csv','out/real5/cogtutor_fractions_calc_lcd.csv');
grid_search('datasets/real5/cogtutor_area_circle.csv','out/real5/cogtutor_area_circle.csv');
grid_search('datasets/real5/khan_adding_sub_fractions.csv','out/real5/khan_adding_sub_fractions.csv');
grid_search('datasets/real5/khan_area_circle.csv','out/real5/khan_area_circle.csv');


%grid_search('datasets/real8/assistments_adding_sub_fractions.csv','out/real8/assistments_adding_sub_fractions.csv');
%grid_search('datasets/real8/assistments_area_circle.csv','out/real8/assistments_area_circle.csv');
grid_search('datasets/real8/cogtutor_fractions_calc_lcd.csv','out/real8/cogtutor_fractions_calc_lcd.csv');
grid_search('datasets/real8/cogtutor_area_circle.csv','out/real8/cogtutor_area_circle.csv');
grid_search('datasets/real8/khan_adding_sub_fractions.csv','out/real8/khan_adding_sub_fractions.csv');
grid_search('datasets/real8/khan_area_circle.csv','out/real8/khan_area_circle.csv');


