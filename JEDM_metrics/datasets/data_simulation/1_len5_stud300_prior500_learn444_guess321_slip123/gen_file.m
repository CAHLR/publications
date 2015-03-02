bnet = make_knowledge_model;
samples = generate_data(bnet, 300);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('1_len5_stud300_prior500_learn444_guess321_slip123.csv',samples)