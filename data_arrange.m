function data_arrange(devIVs,~,y2)

[ivec,class,samples] = size(devIVs);

%% Initializing necessary parameters

t = zeros(ivec,class * samples);             
c1 = zeros(ivec,samples);                   % I-Vectors for class 1
c2 = zeros(ivec,samples);                   % I-Vectors for class 2
c3 = zeros(ivec,samples);                   % I-Vectors for class 3
c4 = zeros(ivec,samples);                   % I-Vectors for class 4
% c5 = zeros(ivec,samples);                   % I-Vectors for class 5

%% Extracting data of all classes into a vector

parfor i = 1:samples * class
    t(:,i) = devIVs(:,i);
end

%% Seperating data according to individual classes and creating targets

for j = 1:samples
    c1(:,j) = t(:,1 + (j - 1) * 4);
    c2(:,j) = t(:,2 + (j - 1) * 4);
    c3(:,j) = t(:,3 + (j - 1) * 4);
    c4(:,j) = t(:,4 + (j - 1) * 4);
%     c5(:,j) = t(:,5 + (j - 1) * 5);
end

iVector = [c1'; c2'; c3'; c4'];
% y = ones(samples * class,1);
% y(1 * samples + 1:2 * samples,:) = 2;
% y(2 * samples + 1:3 * samples,:) = 3;
% y(3 * samples + 1:4 * samples,:) = 4;
% y(4 * samples + 1:5 * samples,:) = 5;

%% Randomly permutate the extracted I-Vectors

sel = randperm(size(iVector, 1));          % holds indices of randomly arranged data values
iVector = iVector(sel,:);                  % arrange data depending upon above indices
y2 = y2(sel,:);                              % arrange targets depending upon above indices

%% Performing Cholesky whitening on the extracted I-Vectors

alpha = 0.1;                               % Cholesky whitening co-efficient
[X,~] = wccn(iVector,y2,alpha);
[X, ~, ~] = featureNormalize(X);

%% Organizing data for further processing

% setting percentages in which data has to be broken
[h,~] = size(X);
p1 = ceil(0.7 * h);
p2 = p1 + ceil(0.2 * h);

% creating file handlers
filename = 'datasvm.mat';
fl = matfile(filename,'Writable',true);

% training data
fl.Xtr = X(1:p1,:);
fl.ytr = y2(1:p1,:);

% cross validation data
fl.Xcv = X(p1 + 1:p2,:);
fl.ycv = y2(p1 + 1:p2,:);

% test data
fl.Xtst = X(p2 + 1:end,:);
fl.ytst = y2(p2 + 1:end,:);

% total data
fl.X = X;
fl.y = y2;

%% Saving data

save indexessvm.mat sel;

%% SVM for evaluation of best I-Vectors

% t = templateSVM();
% Mdl = fitcecoc(X,y,'Learners',t);
% CV = crossval(Mdl);
% oosLossSVM = kfoldLoss(CV);
% 
% t = templateNaiveBayes();
% Mdl = fitcecoc(X,y,'Learners',t);
% CV = crossval(Mdl);
% oosLossNB = kfoldLoss(CV);
% 
% t = templateKNN();
% Mdl = fitcecoc(X,y,'Learners',t);
% CV = crossval(Mdl);
% oosLossKNN = kfoldLoss(CV);
% 
% t = templateTree();
% Mdl = fitcecoc(X,y,'Learners',t);
% CV = crossval(Mdl);
% oosLossTree = kfoldLoss(CV);
% 
% t = templateDiscriminant();
% Mdl = fitcecoc(X,y,'Learners',t);
% CV = crossval(Mdl);
% oosLossDiscri = kfoldLoss(CV);
% 
% oosLoss = (oosLossSVM + oosLossNB + oosLossKNN + oosLossTree + oosLossDiscri) / 5;
% end