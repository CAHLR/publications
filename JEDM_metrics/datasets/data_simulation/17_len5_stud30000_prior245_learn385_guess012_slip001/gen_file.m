bnet = make_knowledge_model;
samples = generate_data(bnet, 30000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('17_len5_stud30000_prior245_learn385_guess012_slip001.csv',samples)