function g = sigmoidGradient(z)
% While backpropagating we need to calculate the gradient of the sigmoid
% functions at each neurons in the hidden layer

% Initialize g
g = zeros(size(z));

% Gradient here is nothing but sigmoid function * (1 - sigmoid function)
g = sigmoid(z).* (1 - sigmoid(z));
end
