function [tot, rmse, count] = predict_and_compare(model,data, threshold)
% returns the proportion of incorrect predictions (0 is perfect, 1 is all bad)

import fit.*

predicted_correct_ans_probs = predict_onestep(model,data);
rmse = 0;
tot = 0;
numResources = 0;
count = 0;
for startlen=[data.starts;data.lengths]
    start = startlen(1);
    len = startlen(2);
    d = data.data(:,start:start+len-1);
    if(size(d, 1) == 1) 
        numResources = numResources + sum(d == 0);
    else
        numResources = numResources + sum(sum(d,1) == 0);
    end
    p = predicted_correct_ans_probs(:,start:start+len-1);
    p = p(d ~= 0);
    d = d(d ~= 0);
    if(size(d, 1) == 1)
        p = p';
        d = d';
    end
    %p = ones(size(d, 1), 1);
    if sum(isnan(p))
        fprintf('NAN summand found, start: %d, len: %d\n', start, len);
    end
    p(isnan(p)) = 1;
    if size(d, 1)
        rmse = rmse + sqrt(sum(abs((d == 2) - p).^2)/size(d, 1));
        count = count + 1;
        if threshold
            p = p > threshold;
        end
        summand = sum(abs((d == 1) - p),1);
        if summand
            tot = tot + summand;
        end
    end
end

% TODO handle missing data
tot = tot ./ (sum(data.lengths) - numResources);
rmse = rmse / count;
end
