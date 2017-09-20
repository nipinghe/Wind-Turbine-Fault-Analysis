load('Data.mat');
% load('RF5.mat');

% class5 = length(unique(y1));
class4 = length(unique(y2));
[Xtr,ytr,Xcv,ycv,Xtst,ytst,X,y] = randomize(X2train,y2train);

% temp = templateTree();
% RFModel = fitcecoc(Xtr,ytr,'Learners',temp,'OptimizeHyperparameters','all',...
%     'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
%     'expected-improvement-plus'));

% temp = templateTree('MinLeafSize',1,'MaxNumSplits',554,'SplitCriterion','twoing','NumVariablesToSample',11);
% RFModel = fitcecoc(Xtr, ytr,'Coding','onevsall','Learners',temp);

%% Performance parameters for training validating data

% fprintf('\n--------------- Training Data ---------------\n');
% [labeltr,~] = predict(RFModel,Xtr);
% results(labeltr,ytr,'Training',class5);
% 
% %% Performance parameters for cross validating data
% 
% fprintf('\n--------------- Cross Validation Data ---------------\n');
% [labelcv,~] = predict(RFModel,Xcv);
% results(labelcv,ycv,'CV',class5);
%   
% %% Performance parameters for testing data
% 
% fprintf('\n--------------- Testing Data ---------------\n');
% labeltst = predict(RFModel,Xtst);
% results(labeltst,ytst,'Testing',class5);

%% Performance parameters for training entire dataset
 
% fprintf('\n--------------- Entire Dataset ---------------\n');
% [labeltt,~] = predict(RFModel,X1test);
% results(labeltt,y1test,'Total',class5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 4 CLASS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Performance parameters for training data

% fprintf('\n--------------- Training Data ---------------\n');
% [labeltr,~] = predict(RFModel,Xtr);
% results(labeltr,ytr,'Training',class4);
% 
% %% Performance parameters for cross validating data
% 
% fprintf('\n--------------- Cross Validation Data ---------------\n');
% [labelcv,~] = predict(RFModel,Xcv);
% results(labelcv,ycv,'CV',class4);
%   
% %% Performance parameters for testing data
% 
% fprintf('\n--------------- Testing Data ---------------\n');
% labeltst = predict(RFModel,Xtst);
% results(labeltst,ytst,'Testing',class4);

%% Performance parameters for training entire dataset
 
fprintf('\n--------------- Entire Dataset ---------------\n');
[labeltt,~] = predict(RFModel,X2test);
results(labeltt,y2test,'Total',class4);

