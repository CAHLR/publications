bnet = make_knowledge_model;
samples = generate_data(bnet, 30000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('5_len5_stud30000_prior500_learn000_guess123_slip321.csv',samples)