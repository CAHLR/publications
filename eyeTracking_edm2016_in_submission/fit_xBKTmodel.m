function model = fit_xBKTmodel(data)

iters=40;

best_ll = -inf;
for i=1:iters
    util.print_dot(i,iters);
    fitmodel = generate.random_model_uni(length(data.actions),size(data.data,1));
    [fitmodel, ll] = fit.EM_fit(fitmodel,data,1e-6,100);
    if (ll(end) > best_ll)
        best_ll = ll(end);
        model = fitmodel;
    end
end
