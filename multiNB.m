load('Data.mat');

[Xtr,ytr,Xcv,ycv,Xtst,ytst,X,y] = randomize(X1train,y1train);
% temp = templateNaiveBayes('DistributionNames','kernel');

NBModel = fitcnb(Xtr,ytr,'OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
    'expected-improvement-plus'));

% NBModel = fitcecoc(xtr, ytr,'Coding','onevsone','Learners',temp);

%% Performance parameters for training validating data

fprintf('\n--------------- Training Data ---------------\n');
[labeltr,~] = predict(NBModel,Xtr);
results(labeltr,ytr,'Training');

%% Performance parameters for cross validating data

fprintf('\n--------------- Cross Validation Data ---------------\n');
[labelcv,~] = predict(NBModel,Xcv);
results(labelcv,ycv,'CV');
  
%% Performance parameters for testing data

% fprintf('\n--------------- Testing Data ---------------\n');
% labeltst = predict(NBModel,Xtst);
% results(labeltst,ytst,'Testing');

%% Performance parameters for training entire dataset
 
% fprintf('\n--------------- Entire Dataset ---------------\n');
% [labeltt,~] = predict(NBModel,X);
% results(labeltt,y,'Total');
