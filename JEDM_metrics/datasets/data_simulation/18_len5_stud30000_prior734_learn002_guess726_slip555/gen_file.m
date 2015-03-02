bnet = make_knowledge_model;
samples = generate_data(bnet, 30000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('18_len5_stud30000_prior734_learn002_guess726_slip555.csv',samples)