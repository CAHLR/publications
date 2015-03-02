bnet = make_knowledge_model;
samples = generate_data(bnet, 30000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('21_len5_stud30000_prior200_learn250_guess650_slip700.csv',samples)