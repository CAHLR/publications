%% model type
type = 'week';
%type = 'quiz';
%type = "clean"; %^([Ww]eek|[Oo]verview|\/courses|[Aa]bout)
%type = 'full';

%% file names
datafile = sprintf('/home/yanbox/data/DemoX-CS999-2020_Spring_Full_1k_sample.%s.data.dat',type);
lenfile = sprintf('/home/yanbox/data/DemoX-CS999-2020_Spring_Full_1k_sample.%s.lengths.dat',type);

nameQfile = sprintf('/home/yanbox/data/names.%s.questions.dat',type);
nameRfile = sprintf('/home/yanbox/data/names.%s.resources.dat',type);

paramQfile = sprintf('+model/params.%s.questions.csv',type);
paramRfile = sprintf('+model/params.%s.resources.csv',type);

%% load data
data = csvread(datafile);
lengths = csvread(lenfile);

datastruct = generate.yanbox_convert_data(data,lengths);

%% parameters
num_subparts = size(datastruct.data,1);
num_resources = size(unique(datastruct.resources),2);
num_fit_initializations = 100;

%% fit models, starting with random initializations
disp('fitting! each dot is a new EM initialization');

best_likelihood = -inf;
for i=1:num_fit_initializations
    util.print_dot(i,num_fit_initializations);
    fitmodel = generate.random_model(num_resources,num_subparts);
    % fitmodel = truemodel; % NOTE: include this line to initialize at the truth
    [fitmodel, log_likelihoods] = fit.EM_fit(fitmodel,datastruct);
    if (log_likelihoods(end) > best_likelihood)
        best_likelihood = log_likelihoods(end);
        best_model = fitmodel;
    end
end


%% display parameters
name_questions = readtable(nameQfile);
name_resources = readtable(nameRfile);

disp('');

Tl = array2table(reshape(best_model.learns,[],1),'VariableNames',{'learns'});
Tf = array2table(reshape(best_model.forgets,[],1),'VariableNames',{'forgets'});

Tg = array2table(best_model.guesses,'VariableNames',{'guesses'});
Ts = array2table(best_model.slips,'VariableNames',{'slips'});

disp('Parameters');
T1 = [name_resources Tl Tf]
T2 = [name_questions Tg Ts];

writetable(T1,paramRfile );
writetable(T2,paramQfile );