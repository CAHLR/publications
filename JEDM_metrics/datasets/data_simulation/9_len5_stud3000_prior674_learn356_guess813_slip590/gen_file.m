bnet = make_knowledge_model;
samples = generate_data(bnet, 3000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('9_len5_stud3000_prior674_learn356_guess813_slip590.csv',samples)