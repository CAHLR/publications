bnet = make_knowledge_model;
samples = generate_data(bnet, 3000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('6_len5_stud3000_prior485_learn236_guess395_slip173.csv',samples)