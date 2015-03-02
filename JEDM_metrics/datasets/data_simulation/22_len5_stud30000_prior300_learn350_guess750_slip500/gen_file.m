bnet = make_knowledge_model;
samples = generate_data(bnet, 30000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('22_len5_stud30000_prior300_learn350_guess750_slip500.csv',samples)