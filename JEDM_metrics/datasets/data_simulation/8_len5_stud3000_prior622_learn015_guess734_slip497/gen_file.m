bnet = make_knowledge_model;
samples = generate_data(bnet, 3000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('8_len5_stud3000_prior622_learn015_guess734_slip497.csv',samples)