function [Xtr,ytr,Xcv,ycv,Xtst,ytst,X,y] = randomize(X,y)

s = randperm(size(X,1));          % holds indices of randomly arranged data values
X = X(s,:);                       % arrange data depending upon above indices
y = y(s,:);                     % arrange targets depending upon above indices

[h,~] = size(X);
q1 = ceil(0.7 * h);
q2 = q1 + ceil(0.2 * h);

% training data
Xtr = X(1:q1,:);
ytr = y(1:q1,:);

% cross validation data
Xcv = X(q1 + 1:q2,:);
ycv = y(q1 + 1:q2,:);

% test data
Xtst = X(q2 + 1:end,:);
ytst = y(q2 + 1:end,:);

end