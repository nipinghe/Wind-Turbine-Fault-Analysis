
load('Data.mat');
%% plotting the i-vector dimensions 

% iv = 20:5:100;
% plot(iv,oosLoss);
% xlim([20 100]);
% ylim([0.84 0.9]);

%% dividing data into testing and training (5 classes)

% train data
% X2train = zeros(800,11);
% X2train(1:200,:) = X2(1:200,:);
% X2train(201:400,:) = X2(241:440,:);
% X2train(401:600,:) = X2(481:680,:);
% X2train(601:800,:) = X2(721:920,:);
% % Xtrain(801:1000,:) = X1(961:1160,:);
% 
% % train data targets
% y2train = zeros(800,1);
% y2train(1:200,:) = y2(1:200,:);
% y2train(201:400,:) = y2(241:440,:);
% y2train(401:600,:) = y2(481:680,:);
% y2train(601:800,:) = y2(721:920,:);
% % ytrain(801:1000,:) = y1(961:1160,:);
% 
% % test data
% X2test = zeros(140,11);
% X2test(1:35,:) = X2(201:235,:);
% X2test(36:70,:) = X2(441:475,:);
% X2test(71:105,:) = X2(681:715,:);
% X2test(106:140,:) = X2(921:955,:);
% % X1test(161:200,:) = X1(1161:1200,:);
% 
% % test data targets
% y2test = zeros(140,1);
% y2test(1:35,:) = y2(201:235,:);
% y2test(36:70,:) = y2(441:475,:);
% y2test(71:105,:) = y2(681:715,:);
% y2test(106:140,:) = y2(921:955,:);
% % y1test(161:200,:) = y1(1161:1200,:);
% 
% X2new = zeros(20,11);
% X2new(1:5,:) = X2(236:240,:);
% X2new(6:10,:) = X2(476:480,:);
% X2new(11:15,:) = X2(716:720,:);
% X2new(16:20,:) = X2(956:960,:);
% % X1new(21:25,:) = X1(1196:1200,:);
% 
% % test data targets
% y2new = zeros(20,1);
% y2new(1:5,:) = y2(236:240,:);
% y2new(6:10,:) = y2(476:480,:);
% y2new(11:15,:) = y2(716:720,:);
% y2new(16:20,:) = y2(956:960,:);
% % y1new(21:25,:) = y1(1196:1200,:);

%% try

% [X1tr, ~, ~] = featureNormalize(X1train);
% t = templateSVM();
% Mdl = fitcecoc(X1tr,y1train,'Learners',t);
% CV = crossval(Mdl);
% oosLossSVM = kfoldLoss(CV);
