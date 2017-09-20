function [C] = poly(X, p)
%   Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%

% You need to concatenate the following variables correctly.
A = zeros(size(X,1), p*p);
B = zeros(size(X,1), p*p);
k = 1;

for i = 1:p
    for j = 1:p
        A(:,k) = X(:,i) .^ j; % find higher order polynomial features
        B(:,k) = sin(X(:,i)) .^ j; % find sinusoidal features
        k = k + 1;
    end
end

C = [A B];

end