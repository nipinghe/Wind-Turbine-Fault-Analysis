close all;
clc;

load('Theta_93.mat');
load('Set1.mat');

test = test(randperm(size(test,1)),:);
[t_norm, mu, sigma] = featureNormalize(test(:,1:4));

T = t_norm;
y = test(:,5);

testing = predict(Theta1, Theta2, T);
fprintf('predicted: %d, actual: %d\n', testing, y);
fprintf('\n Testing Set Accuracy: %f\n', mean(double(testing == y)) * 100);