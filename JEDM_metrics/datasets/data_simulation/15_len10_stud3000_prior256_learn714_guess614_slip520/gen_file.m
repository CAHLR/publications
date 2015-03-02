bnet = make_knowledge_model;
samples = generate_data(bnet, 3000);
samples = samples (:,11:20);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('15_len10_stud3000_prior256_learn714_guess614_slip520.csv',samples)