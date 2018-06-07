function [theta] = gradientDescent(X, y, theta, alpha, num_iters)
m = length(y); 
for iter = 1:num_iters
   [J1, grad1] = costFunction(theta, X, y);
   theta = theta - alpha * grad1;
end
end
