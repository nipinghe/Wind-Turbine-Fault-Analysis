function [X_norm, mu, s] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
s = zeros(1, size(X, 2));

for i = 1:size(X,2)
    mu = mean(X(:,i));
    s = std(X(:,i));
    X_norm(:,i) = (X(:,i) - mu) ./ s;
end

end