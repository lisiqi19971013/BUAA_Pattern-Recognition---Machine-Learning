function g = sigmoidGradient(z)
g = zeros(size(z));
g = sigmoid(z) .* (1-sigmoid(z));
%  g = 1 - (sigmoid(z) .* sigmoid(z));
% g = 0.25;
end
