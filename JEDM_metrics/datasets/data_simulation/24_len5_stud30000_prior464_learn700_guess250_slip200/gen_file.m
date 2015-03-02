bnet = make_knowledge_model;
samples = generate_data(bnet, 30000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('24_len5_stud30000_prior464_learn700_guess250_slip200.csv',samples)