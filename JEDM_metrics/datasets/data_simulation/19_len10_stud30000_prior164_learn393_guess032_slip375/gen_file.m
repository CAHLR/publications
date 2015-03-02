bnet = make_knowledge_model;
samples = generate_data(bnet, 30000);
samples = samples (:,11:20);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('19_len10_stud30000_prior164_learn393_guess032_slip375.csv',samples)