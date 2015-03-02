bnet = make_knowledge_model;
samples = generate_data(bnet, 3000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('10_len5_stud3000_prior145_learn542_guess356_slip825.csv',samples)