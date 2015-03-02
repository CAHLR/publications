bnet = make_knowledge_model;
samples = generate_data(bnet, 30000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('26_len5_stud30000_prior643_learn900_guess250_slip600.csv',samples)