function run_search()
addpath(genpath('../MLE-hmm'));
M=[];

[d1,d2,d3]=search_compare(0.5,0.444,0.321,0.123,'in/1_len5_stud300_priorW_learnX_guessY_slipZ.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(0.2,0.444,0.321,0.123,'in/2_len5_stud3000_priorW_learnX_guessY_slipZ.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(0.8,0.444,0.321,0.123,'in/3_len5_stud3000_priorW_learnX_guessY_slipZ.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(0.5,0,0.321,0.123,'in/4_len5_stud3000_priorW_learnX_guessY_slipZ.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.5,0,.123,.321,'in/5_len5_stud30000_priorW_learnX_guessY_slipZ.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.485,.236,.396,.173,'in/6_len5_stud3000_prior485_learn236_guess395_slip173.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.146,.525,.225,.351,'in/7_len5_stud3000_prior146_learn525_guess225_slip351.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.622,.015,.734,.497,'in/8_len5_stud3000_prior622_learn015_guess734_slip497.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.674,.356,.813,.590,'in/9_len5_stud3000_prior674_learn356_guess813_slip590.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.145,.542,.356,.825,'in/10_len5_stud3000_prior145_learn542_guess356_slip825.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.745,.683,.570,.735,'in/11_len5_stud3000_prior745_learn683_guess570_slip735.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.135,.356,.013,.223,'in/12_len10_stud3000_prior135_learn356_guess013_slip223.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.872,.145,.514,.014,'in/13_len10_stud3000_prior872_learn145_guess514_slip014.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.175,.375,.015,.532,'in/14_len10_stud3000_prior175_learn375_guess015_slip532.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.256,.714,.614,.520,'in/15_len10_stud3000_prior256_learn714_guess614_slip520.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.618,.154,.389,.820,'in/16_len10_stud3000_prior618_learn154_guess389_slip820.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.245,.385,.012,.001,'in/17_len5_stud30000_prior245_learn385_guess012_slip001.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.734,.002,.726,.555,'in/18_len5_stud30000_prior734_learn002_guess726_slip555.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.164,.393,.032,.375,'in/19_len10_stud30000_prior164_learn393_guess032_slip375.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.724,.155,.726,.830,'in/20_len10_stud30000_prior724_learn155_guess726_slip830.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.200,.250,.650,.700,'in/21_len5_stud30000_prior200_learn250_guess650_slip700.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.300,.350,.750,.500,'in/22_len5_stud30000_prior300_learn350_guess750_slip500.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.400,.450,.450,.750,'in/23_len5_stud30000_prior400_learn450_guess450_slip750.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.464,.700,.250,.200,'in/24_len5_stud30000_prior464_learn700_guess250_slip200.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.564,.800,.350,.400,'in/25_len5_stud30000_prior564_learn800_guess350_slip400.csv');
M=[M;[d1 d2 d3]];
[d1,d2,d3]=search_compare(.643,.900,.250,.600,'in/26_len5_stud30000_prior643_learn900_guess250_slip600.csv');
M=[M;[d1 d2 d3]];
dlmwrite('search_auc_acc.csv',M);
