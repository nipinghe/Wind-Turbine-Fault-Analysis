%% Finding the AIC of the model

load('ball_data.mat');
                      
ball_data = ball_data(:)';
AIC = zeros(1,9);                           % array containing AIC vlaues of equivalent number of gaussians
GMModels = cell(1,9);                       % create a cell matrix 
options = statset('MaxIter',500);

% mean can be random or start with mean(PE, 2)+- sigma (if not mu = 0)
for k = 1:9                                % compute gaussian models with 
    tic;
    count = fprintf(['Fitting GMM ' num2str(k) ' of '...
               num2str(9)]);
    GMModels{k} = fitgmdist(cell2mat(ball_data)',2 ^ k,'Options',options,...
                                       'CovType','diagonal','SharedCov',...
                                true, 'Replicates', 3);
    AIC(k)= GMModels{k}.AIC;   % calculate AIC values for each GMM model of a particular number of gaussian
    fprintf(repmat('\b', 1, count));
    toc;
end

 [v,ind] = min(AIC);


