function [Error,Error2] = auc(Actual,Predicted)
  nTarget     = sum(double(Actual == 1));
nBackground = sum(double(Actual == 0));

        % Rank data
        R = tiedrank(Predicted);  % 'tiedrank' from Statistics Toolbox
        R2 = tiedrank(round(Predicted));  % 'tiedrank' from Statistics Toolbox

        % Calculate AUC
        Error = (sum(R(Actual == 1)) - (nTarget^2 + nTarget)/2) / (nTarget * nBackground);
        Error2 = (sum(R2(Actual == 1)) - (nTarget^2 + nTarget)/2) / (nTarget * nBackground);
