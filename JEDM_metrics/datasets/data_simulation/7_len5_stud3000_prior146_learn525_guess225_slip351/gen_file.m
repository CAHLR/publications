bnet = make_knowledge_model;
samples = generate_data(bnet, 3000);
samples = samples (:,6:10);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('7_len5_stud3000_prior146_learn525_guess225_slip351.csv',samples)