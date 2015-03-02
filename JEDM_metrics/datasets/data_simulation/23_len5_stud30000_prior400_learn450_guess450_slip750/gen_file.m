bnet = make_knowledge_model;
samples = generate_data(bnet, 30000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('23_len5_stud30000_prior400_learn450_guess450_slip750.csv',samples)