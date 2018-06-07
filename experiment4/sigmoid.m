function g = sigmoid(z)
g = 1.0 ./ (1.0 + exp(-z));
% g = 2.0 ./ (1.0 + exp(-2*z)) - 1;
% g = 10*z;
end
