load('Data.mat');
% load('SVM5.mat');

% class5 = length(unique(y1));
class4 = length(unique(y2));
[Xtr,ytr,Xcv,ycv,Xtst,ytst,X,y] = randomize(X2train,y2train);

temp = templateSVM('Standardize',true,'CacheSize',8000,'KernelFunction','gaussian');
SVMModel = fitcecoc(Xtr,ytr,'Learners',temp,'OptimizeHyperparameters','auto',...
    'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
    'expected-improvement-plus'));

%% Learnt parameters

% temp = templateSVM('Standardize',true,'CacheSize',8000,'KernelFunction','gaussian','BoxConstraint',77.64,'KernelScale',3.1432);
% SVMModel = fitcecoc(Xtr, ytr,'Coding','onevsall','Learners',temp);

%% Performance parameters for training validating data

% fprintf('\n--------------- Training Data ---------------\n');
% [labeltr,~] = predict(SVMModel,Xtr);
% results(labeltr,ytr,'Training',class5);
% 
% %% Performance parameters for cross validating data
% 
% fprintf('\n--------------- Cross Validation Data ---------------\n');
% [labelcv,~] = predict(SVMModel,Xcv);
% results(labelcv,ycv,'CV',class5);
%   
% %% Performance parameters for testing data
% 
% fprintf('\n--------------- Testing Data ---------------\n');
% labeltst = predict(SVMModel,Xtst);
% results(labeltst,ytst,'Testing',class5);

% %% Performance parameters for training entire dataset
 
% fprintf('\n--------------- Entire Dataset ---------------\n');
% [labeltt,~] = predict(SVMModel,X1test);
% results(labeltt,y1test,'Total',class5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 4 CLASS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Performance parameters for training data

fprintf('\n--------------- Training Data ---------------\n');
[labeltr,~] = predict(SVMModel,Xtr);
results(labeltr,ytr,'Training',class4);

%% Performance parameters for cross validating data

fprintf('\n--------------- Cross Validation Data ---------------\n');
[labelcv,~] = predict(SVMModel,Xcv);
results(labelcv,ycv,'CV',class4);
%   
% %% Performance parameters for testing data
% 
% fprintf('\n--------------- Testing Data ---------------\n');
% labeltst = predict(SVMModel,Xtst);
% results(labeltst,ytst,'Testing',class4);

%% Performance parameters for training entire dataset
 
% fprintf('\n--------------- Entire Dataset ---------------\n');
% [labeltt,~] = predict(SVMModel,X2test);
% results(labeltt,y2test,'Total',class4);

