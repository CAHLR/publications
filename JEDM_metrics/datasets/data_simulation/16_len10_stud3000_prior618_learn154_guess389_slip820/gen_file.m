bnet = make_knowledge_model;
samples = generate_data(bnet, 3000);
samples = samples (:,11:20);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('16_len10_stud3000_prior618_learn154_guess389_slip820.csv',samples)