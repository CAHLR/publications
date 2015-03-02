bnet = make_knowledge_model;
samples = generate_data(bnet, 30000);
samples = samples (:,11:20);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('20_len10_stud30000_prior724_learn155_guess726_slip830.csv',samples)