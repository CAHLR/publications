bnet = make_knowledge_model;
samples = generate_data(bnet, 30000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('25_len5_stud30000_prior564_learn800_guess350_slip400.csv',samples)