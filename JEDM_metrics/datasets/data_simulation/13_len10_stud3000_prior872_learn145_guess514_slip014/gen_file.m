bnet = make_knowledge_model;
samples = generate_data(bnet, 3000);
samples = samples (:,11:20);
samples = cell2mat(samples);
samples = samples-1;
csvwrite('13_len10_stud3000_prior872_learn145_guess514_slip014.csv',samples)