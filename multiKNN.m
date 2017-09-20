load('Data.mat');
% load('KNN5.mat');

% class5 = length(unique(y1));
class4 = length(unique(y2));
[Xtr,ytr,Xcv,ycv,Xtst,ytst,X,y] = randomize(X2train,y2train);

% temp = templateKNN('Standardize',true);
% KNNModel = fitcecoc(Xtr,ytr,'Learners',temp,'OptimizeHyperparameters','auto',...
%     'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
%     'expected-improvement-plus'));

% temp = templateKNN('Standardize',true,'NumNeighbors',2,'Distance','cityblock');
% KNNModel = fitcecoc(Xtr, ytr,'Coding','onevsall','Learners',temp);

%% Performance parameters for training validating data

% fprintf('\n--------------- Training Data ---------------\n');
% [labeltr,~] = predict(KNNModel,Xtr);
% results(labeltr,ytr,'Training',class5);
% 
% %% Performance parameters for cross validating data
% 
% fprintf('\n--------------- Cross Validation Data ---------------\n');
% [labelcv,~] = predict(KNNModel,Xcv);
% results(labelcv,ycv,'CV',class5);
%   
% %% Performance parameters for testing data
% 
% fprintf('\n--------------- Testing Data ---------------\n');
% labeltst = predict(KNNModel,Xtst);
% results(labeltst,ytst,'Testing',class5);

%% Performance parameters for training entire dataset
 
% fprintf('\n--------------- Entire Dataset ---------------\n');
% [labeltt,~] = predict(KNNModel,X1test);
% results(labeltt,y1test,'Total',class5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 4 CLASS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Performance parameters for training data

% fprintf('\n--------------- Training Data ---------------\n');
% [labeltr,~] = predict(KNNModel,Xtr);
% results(labeltr,ytr,'Training',class4);
% 
% %% Performance parameters for cross validating data
% 
% fprintf('\n--------------- Cross Validation Data ---------------\n');
% [labelcv,~] = predict(KNNModel,Xcv);
% results(labelcv,ycv,'CV',class4);
%   
% %% Performance parameters for testing data
% 
% fprintf('\n--------------- Testing Data ---------------\n');
% labeltst = predict(KNNModel,Xtst);
% results(labeltst,ytst,'Testing',class4);

%% Performance parameters for training entire dataset
 
fprintf('\n--------------- Entire Dataset ---------------\n');
[labeltt,~] = predict(KNNModel,X2test);
results(labeltt,y2test,'Total',class4);

