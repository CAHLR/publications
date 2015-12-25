function run_real_search_save()
addpath(genpath('../../MLE-hmm'));

%for str = {'assistments_adding_sub_fractions','assistments_area_circle','cogtutor_fractions_calc_lcd','cogtutor_area_circle','khan_adding_sub_fractions','khan_area_circle'}
for str = {'assistments_exponents','cogtutor_exponents_2','khan_exponents_2'}
  search_save(strcat('datasets/real5/',str{1},'.csv'), strcat('out/real5/',str{1},'_params.csv'));
end

