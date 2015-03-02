bnet = make_knowledge_model;
samples = generate_data(bnet, 3000);
samples = samples (:,11:20);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('12_len10_stud3000_prior135_learn356_guess013_slip223.csv',samples)