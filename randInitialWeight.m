%% Randomly weight initialization function
function W = randInitialWeight(inp_layer, hid_layer)
% Weights are randomly initialized using this function. It takes in number
% of units based on number of layers from first to L - 1 layer.

% We have to consider bias as well, hence 1 + 'no of input layer neurons'.
W = zeros(hid_layer, 1 + inp_layer); %7x12
disp(size(W));

epsilon = 0.05;
W = (rand(hid_layer, 1 + inp_layer) * 2 * epsilon) - epsilon;
end

