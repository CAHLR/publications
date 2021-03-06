function run_gird_search_small()
addpath(genpath('../MLE-hmm'));
grid_search_small('in/1_len5_stud300_priorW_learnX_guessY_slipZ.csv','out/1_small.csv',0.5,0.444,0.321,0.123);
grid_search_small('in/2_len5_stud3000_priorW_learnX_guessY_slipZ.csv','out/2_small.csv',0.2,0.444,0.321,0.123);
grid_search_small('in/3_len5_stud3000_priorW_learnX_guessY_slipZ.csv','out/3_small.csv',0.8,0.444,0.321,0.123);
grid_search_small('in/4_len5_stud3000_priorW_learnX_guessY_slipZ.csv','out/4_small.csv',0.5,0,0.321,0.123);
grid_search_small('in/5_len5_stud30000_priorW_learnX_guessY_slipZ.csv','out/5_small.csv',.5,0,.123,.321);
grid_search_small('in/6_len5_stud3000_prior485_learn236_guess395_slip173.csv','out/6_small.csv',.485,.236,.396,.173);
grid_search_small('in/7_len5_stud3000_prior146_learn525_guess225_slip351.csv','out/7_small.csv',.146,.525,.225,.351);
grid_search_small('in/8_len5_stud3000_prior622_learn015_guess734_slip497.csv','out/8_small.csv',.622,.015,.734,.497);
grid_search_small('in/9_len5_stud3000_prior674_learn356_guess813_slip590.csv','out/9_small.csv',.674,.356,.813,.590);
grid_search_small('in/10_len5_stud3000_prior145_learn542_guess356_slip825.csv','out/10_small.csv',.145,.542,.356,.825);
grid_search_small('in/11_len5_stud3000_prior745_learn683_guess570_slip735.csv','out/11_small.csv',.745,.683,.570,.735);
grid_search_small('in/12_len10_stud3000_prior135_learn356_guess013_slip223.csv','out/12_small.csv',.135,.356,.013,.223);
grid_search_small('in/13_len10_stud3000_prior872_learn145_guess514_slip014.csv','out/13_small.csv',.872,.145,.514,.014);
grid_search_small('in/14_len10_stud3000_prior175_learn375_guess015_slip532.csv','out/14_small.csv',.175,.375,.015,.532);
grid_search_small('in/15_len10_stud3000_prior256_learn714_guess614_slip520.csv','out/15_small.csv',.256,.714,.614,.520);
grid_search_small('in/16_len10_stud3000_prior618_learn154_guess389_slip820.csv','out/16_small.csv',.618,.154,.389,.820);
addpath(genpath('../MLE-hmm'));
grid_search_small('in/17_len5_stud30000_prior245_learn385_guess012_slip001.csv','out/17_small.csv',.245,.385,.012,.001);
grid_search_small('in/18_len5_stud30000_prior734_learn002_guess726_slip555.csv','out/18_small.csv',.734,.002,.726,.555);
grid_search_small('in/19_len10_stud30000_prior164_learn393_guess032_slip375.csv','out/19_small.csv',.164,.393,.032,.375);
grid_search_small('in/20_len10_stud30000_prior724_learn155_guess726_slip830.csv','out/20_small.csv',.724,.155,.726,.830);
grid_search_small('in/21_len5_stud30000_prior200_learn250_guess650_slip700.csv','out/21_small.csv',.200,.250,.650,.700);
grid_search_small('in/22_len5_stud30000_prior300_learn350_guess750_slip500.csv','out/22_small.csv',.300,.350,.750,.500);
grid_search_small('in/23_len5_stud30000_prior400_learn450_guess450_slip750.csv','out/23_small.csv',.400,.450,.450,.750);
grid_search_small('in/24_len5_stud30000_prior464_learn700_guess250_slip200.csv','out/24_small.csv',.464,.700,.250,.200);
grid_search_small('in/25_len5_stud30000_prior564_learn800_guess350_slip400.csv','out/25_small.csv',.564,.800,.350,.400);
grid_search_small('in/26_len5_stud30000_prior643_learn900_guess250_slip600.csv','out/26_small.csv',.643,.900,.250,.600);
