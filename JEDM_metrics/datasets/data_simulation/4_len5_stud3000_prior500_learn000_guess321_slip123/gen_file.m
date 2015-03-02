bnet = make_knowledge_model;
samples = generate_data(bnet, 3000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('4_len5_stud3000_prior500_learn000_guess321_slip123.csv',samples)