function run_heat()
addpath(genpath('../MLE-hmm'));
grid_search_heatmap('in/1_len5_stud300_priorW_learnX_guessY_slipZ.csv','out/1_heat.csv',.5,.444);
grid_search_heatmap('in/2_len5_stud3000_priorW_learnX_guessY_slipZ.csv','out/2_heat.csv',.2,.444);
grid_search_heatmap('in/3_len5_stud3000_priorW_learnX_guessY_slipZ.csv','out/3_heat.csv',.8,.444);
grid_search_heatmap('in/4_len5_stud3000_priorW_learnX_guessY_slipZ.csv','out/4_heat.csv',.5,0);
grid_search_heatmap('in/5_len5_stud30000_priorW_learnX_guessY_slipZ.csv','out/5_heat.csv',.5,0);
grid_search_heatmap('in/6_len5_stud3000_prior485_learn236_guess395_slip173.csv','out/6_heat.csv',.485,.236);
grid_search_heatmap('in/7_len5_stud3000_prior146_learn525_guess225_slip351.csv','out/7_heat.csv',.146,.525);
grid_search_heatmap('in/8_len5_stud3000_prior622_learn015_guess734_slip497.csv','out/8_heat.csv',.622,.015);
grid_search_heatmap('in/9_len5_stud3000_prior674_learn356_guess813_slip590.csv','out/9_heat.csv',.674,.356);
grid_search_heatmap('in/10_len5_stud3000_prior145_learn542_guess356_slip825.csv','out/10_heat.csv',.145,.542);
grid_search_heatmap('in/11_len5_stud3000_prior745_learn683_guess570_slip735.csv','out/11_heat.csv',.745,.683);
grid_search_heatmap('in/12_len10_stud3000_prior135_learn356_guess013_slip223.csv','out/12_heat.csv',.135,.356);
grid_search_heatmap('in/13_len10_stud3000_prior872_learn145_guess514_slip014.csv','out/13_heat.csv',.872,.145);
grid_search_heatmap('in/14_len10_stud3000_prior175_learn375_guess015_slip532.csv','out/14_heat.csv',.172,.375);
grid_search_heatmap('in/15_len10_stud3000_prior256_learn714_guess614_slip520.csv','out/15_heat.csv',.256,.714);
grid_search_heatmap('in/16_len10_stud3000_prior618_learn154_guess389_slip820.csv','out/16_heat.csv',.618,.154);
grid_search_heatmap('in/17_len5_stud30000_prior245_learn385_guess012_slip001.csv','out/17_heat.csv',.245,.385);
grid_search_heatmap('in/18_len5_stud30000_prior734_learn002_guess726_slip555.csv','out/18_heat.csv',.734,.002);
grid_search_heatmap('in/19_len10_stud30000_prior164_learn393_guess032_slip375.csv','out/19_heat.csv',.164,.393);
grid_search_heatmap('in/20_len10_stud30000_prior724_learn155_guess726_slip830.csv','out/20_heat.csv',.724,.155);
grid_search_heatmap('in/21_len5_stud30000_prior200_learn250_guess650_slip700.csv','out/21_heat.csv',.2,.25);
grid_search_heatmap('in/22_len5_stud30000_prior300_learn350_guess750_slip500.csv','out/22_heat.csv',.3,.35);
grid_search_heatmap('in/23_len5_stud30000_prior400_learn450_guess450_slip750.csv','out/23_heat.csv',.4,.45);
grid_search_heatmap('in/24_len5_stud30000_prior464_learn700_guess250_slip200.csv','out/24_heat.csv',.464,.7);
grid_search_heatmap('in/25_len5_stud30000_prior564_learn800_guess350_slip400.csv','out/25_heat.csv',.564,.8);
grid_search_heatmap('in/26_len5_stud30000_prior643_learn900_guess250_slip600.csv','out/26_heat.csv',.643,.9);
