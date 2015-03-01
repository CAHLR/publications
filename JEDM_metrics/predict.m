function pred_reshape = predict(data, prior, learn, guess, slip)
m = generate.random_model_uni(1,1);
m.prior = prior;
m.learns = learn;
m.guesses = guess;
m.slips = slip;

[students,questions]=size(data);
data_onerow = reshape(data',1,students*questions);
d=struct;
d.stateseqs=int8(ones(1,students*questions));
dataT=data';                                                                  
d.data=int8(dataT(:)'+1); % A(:) converts a matrix A to a vector column-wise
d.lengths=int32(questions*ones(students,1));
d.starts=int32(cumsum(d.lengths)-(questions-1));
d.resources=int16(ones(1,students*questions));

[pred,state] = fit.predict_onestep(m,d);
pred_reshape = reshape(pred,questions,students)';
