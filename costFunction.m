
function [J, grad] = costFunction(nn_params, features, hidden_layers, num_labels, X, y, lambda)

% We reshape the parameters again into the matrix form from the vector form

% hidden = 7 + 1, input = 11 + 1, output = 4, Theta1 = 7x12
Theta1 = reshape(nn_params(1:hidden_layers * (features + 1)), hidden_layers, (features + 1));
% hidden = 7 + 1, input = 11 + 1, output = 4, Theta2 = 4x8
Theta2 = reshape(nn_params((1 + (hidden_layers * (features + 1))):end), num_labels, (hidden_layers + 1));

% The number of training examples
m = size(X,1); % 160

% Initializing cost and gradient variables
J = 0;
Theta1_grad = zeros(size(Theta1)); % 7x12
Theta2_grad = zeros(size(Theta2)); % 4x8

%% Initialize the output class vector and input vector

I = eye(num_labels); % 4x4 identity matrix
Y = zeros(m,num_labels); % 130x4
for i = 1:m
    Y(i,:) = I(y(i),:); % 130x4
end

X = [ones(m,1) X]; % 80x12

%% Forward Propagation begins

z2 = X * Theta1'; % 130x12 x 12x7 = 130x7
a2 = sigmoid(z2); % 130x7
a2 = [ones(size(a2,1),1) a2]; % 130x8
z3 = a2 * Theta2'; % 130x8 x 8x4 = 130x4
h = sigmoid(z3); % 130x4

%% Calculate cost and regularization parameter

J = sum(sum(-1 * ((Y .* log(h)) + ((1 - Y) .* log(1 - h))),2)) * (1 / m);
reg = (lambda / 2 * m) * (sum(sum(Theta1(:,2:end) .^ 2,2)) + sum(sum(Theta2(:,2:end) .^ 2,2)));
J = J + reg;

%% Back Propogation begins: Compute errors in output and hidden layer

sigma3 = h - Y; % 130x4 - 130x4 = 130x4
sigma2 = sigma3 * Theta2 .* sigmoidGradient([ones(size(z2,1),1) z2]); % (130x4 * 5x8) .* 130x8 = 130x8
sigma2 = sigma2(:,2:end); % 130x4

%% Update the weights depending upon error calculated in hidden and output layers

Delta1 = sigma2' * X;  % 7x130 * 130x12 = 7x12
Delta2 = sigma3' * a2; % 4x130 * 130x8 = 4x8

%% Calculate the gradients depending upon this new weights calculated

Theta1_grad = (Delta1 ./ m) + lambda * [zeros(size(Theta1,1),1) Theta1(:,2:end)];
Theta2_grad = (Delta2 ./ m) + lambda * [zeros(size(Theta2,1),1) Theta2(:,2:end)];

%% Unrolling the parameters
grad = [Theta1_grad(:); Theta2_grad(:)];

end