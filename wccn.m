function [ivec, W] = wccn(X,y,alfa)
%[ L, W] = WCCN( X,Y,alfa)
%       Within-Class Covariance Normalization
%       X - observations matrix(rows corespond to observations)
%       Y - class row vector
%       alfa - smooth coefficient (optional)
%           
%       Example: 
%       L = wccn( X,Y);
%       X_wccn = X * L;
%       
%       author: skacprza@agh.edu.pl
%
%       based on:
%       Hatch, Andrew O., Sachin S. Kajarekar, and Andreas Stolcke.
%       "Within-class covariance normalization for SVM-based speaker recognition." Interspeech. 2006.
%
%       Dehak, Najim, et al. "Front-end factor analysis for speaker verification."
%       IEEE Transactions on Audio, Speech, and Language Processing 19.4 (2011): 788-798.

W = zeros(size(X,2));
C = unique(y);
for s = C'
    idx = (y == s);
    w =  X(idx,:);
    W = W + cov(w,1);                          % normalization by N. For N -1 use cov(w,0).
end

W = W ./ length(C);
W = (1 - alfa) * W + alfa * eye(length(W));

vwccn = chol((W) ^ -1,'lower');
ivec = X * vwccn;
end