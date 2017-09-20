load('Data.mat');

p = 3;
C = poly(X2,p); 
X2 = [X2 C]; % creating a unified feature space
[X1tr, ~, ~] = featureNormalize(X2);               % normalizing features
num_classes = 4;                     % number of classes in our data
samples_per_class = 200;             % number of samples per class in our data
[num_samples, num_features] = size(X1tr);            % size of the training data
ball_data1 = cell(num_classes, samples_per_class);    % create a cell as GMM requires a cell

% assigning each data sample to a cell in feature X sample format
for i = 1:num_classes
    for j = 1:samples_per_class
        ball_data1{i,j} = X1tr(j,:)';
    end
end

%% To compute the best I-Vector dimension

% a = 1;
% oosLoss = zeros(1,16);
% save ball_data.mat ball_data;
% for iv = 20:5:100
%     factors = i_vector(ball_data,iv);
%     sel = 0;
%     oosLoss(1,a) = data_arrange(factors,sel);
%     a = a + 1;
% end

%% Extracting I-Vectors

save ball_data1.mat ball_data1;
dimensions = 25;       % I-Vector dimension to be kept
factors = i_vector(ball_data1,dimensions);
sel = 0;
data_arrange(factors,sel,y2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load('Data.mat');
% 
% num_classes = 5;
% samples = 200;
% X1tr = cell(num_classes, samples);
% X1tst = cell(num_classes, 35);
% 
% for i = 1:num_classes
%     for j = 1:samples
%         X1tr{i,j} = X1train(j,:);
%     end
% end
% 
% for i = 1:num_classes
%     for j = 1:35
%         X1tst{i,j} = X1test(j,:);
%     end
% end