%% Vibration Classification using multi class classification using neural networks


%% Clearing all and setting the environment
clear;
close all;
clc;

%% Loading the datasets 
load('Data.mat');

% Randomly arranging training datasets and normalizing them
[m,n] = size(X1);
sel = randperm(m);
X1 = X1(sel,:);
y1 = y1(sel,:);
[Xn, mu, sigma] = featureNormalize(X1);

Xtrain = Xn(1:720,:);
ytrain = y1(1:720,:);

Xcv = Xn(721:960,:);
ycv = y1(721:960,:);

Xtest = Xn(961:1200,:);
ytest = y1(961:1200,:); 

%% Setting parameters

features = n;
hidden_layers = 10;                          % no of neurons in hidden layer
num_labels = length(unique(y1));            % classes 1 to 5

%% Initializing initial parameters
fprintf('Initializing of neural network parameters... ');

% Calculating random initial weights to break network symmetry
i_Theta1 = randInitialWeight(features, hidden_layers);
i_Theta2 = randInitialWeight(hidden_layers, num_labels);

% Parameter matrices needs to be unrolled as it takes in vectors and not
% matrices as inputs.
init_nn_params = [i_Theta1(:); i_Theta2(:)];

%% Training Backpropagation Network

options = optimset('MaxIter', 1500);

%  You should also try different values of lambda
lambda = 0; % no regularization required as network is not that complex

% Create "short hand" for the cost function to be minimized
costFunc = @(p) costFunction(p, ...
                                   features, ...
                                   hidden_layers, ...
                                   num_labels, Xtrain, ytrain, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunc, init_nn_params, options);

% Obtain trained Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layers * (features + 1)), ...
                 hidden_layers, (features + 1));

Theta2 = reshape(nn_params((1 + (hidden_layers * (features + 1))):end), ...
                 num_labels, (hidden_layers + 1));


%% Checking Training Set Accuracy

pred1 = predict(Theta1, Theta2, Xtrain);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred1 == ytrain)) * 100);

%% Checking Testing Set Accuracy

pred2 = predict(Theta1, Theta2, Xtest);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred2 == ytest)) * 100);





