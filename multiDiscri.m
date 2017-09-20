load('Data.mat');
% load('DM5.mat');

% class5 = length(unique(y1));
class4 = length(unique(y2));
[Xtr,ytr,Xcv,ycv,Xtst,ytst,X,y] = randomize(X2train,y2train);

% temp = templateDiscriminant();
% DModel = fitcecoc(Xtr,ytr,'Learners',temp,'OptimizeHyperparameters','auto',...
%     'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
%     'expected-improvement-plus'));

% temp = templateDiscriminant('Delta',2.9558e-06,'Gamma',7.5307e-05);
% DModel = fitcecoc(Xtr, ytr,'Coding','onevsone','Learners',temp);

%% Performance parameters for training data

% fprintf('\n--------------- Training Data ---------------\n');
% [labeltr,~] = predict(DModel,Xtr);
% results(labeltr,ytr,'Training',class5);
% 
% %% Performance parameters for cross validating data
% 
% fprintf('\n--------------- Cross Validation Data ---------------\n');
% [labelcv,~] = predict(DModel,Xcv);
% results(labelcv,ycv,'CV',class5);
  
% %% Performance parameters for testing data
% 
% fprintf('\n--------------- Testing Data ---------------\n');
% labeltst = predict(DModel,Xtst);
% results(labeltst,ytst,'Testing',class5);

%% Performance parameters for training entire dataset
 
% fprintf('\n--------------- Entire Dataset ---------------\n');
% [labeltt,~] = predict(DModel,X1test);
% results(labeltt,y1test,'Total',class5);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 4 CLASS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Performance parameters for training data

% fprintf('\n--------------- Training Data ---------------\n');
% [labeltr,~] = predict(DModel,Xtr);
% results(labeltr,ytr,'Training',class4);
% 
% %% Performance parameters for cross validating data
% 
% fprintf('\n--------------- Cross Validation Data ---------------\n');
% [labelcv,~] = predict(DModel,Xcv);
% results(labelcv,ycv,'CV',class4);
%   
% %% Performance parameters for testing data
% 
% fprintf('\n--------------- Testing Data ---------------\n');
% labeltst = predict(DModel,Xtst);
% results(labeltst,ytst,'Testing',class4);

%% Performance parameters for training entire dataset
 
fprintf('\n--------------- Entire Dataset ---------------\n');
[labeltt,~] = predict(DModel,X2test);
results(labeltt,y2test,'Total',class4);
