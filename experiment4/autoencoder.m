clear ; close all; clc
input_layer_size  = 4;  
hidden_layer_size = 3; 
num_labels = 4;   
[SL,SW,PL,PW,T] = textread('data.txt','%f%f%f%f%s',150,'delimiter',',');
X=[SL,SW,PL,PW];
m = size(X, 1);
y=X;
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

lambda = 0;
alpha1 = 1;
ep = 1000;
% cost1 = zeros(1,ep);
% for i=1:ep
%     [cost1(i),grad] = ecCostFunction(nn_params,input_layer_size,hidden_layer_size,num_labels, X, y, lambda);
%     nn_params = nn_params - alpha1 * grad;
% end
% plot(1:ep,abs(cost1));
% title('Cost - Epochs');xlabel('Epochs');ylabel('Cost');
% Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
% Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end),num_labels, (hidden_layer_size + 1));

options = optimset('MaxIter', ep);
ecostFunction = @(p) ecCostFunction(p,input_layer_size,hidden_layer_size,num_labels, X, y, lambda);
[nn_params, cost] = fmincg(ecostFunction, initial_nn_params, options);
plot(1:ep,abs(cost));
title('Cost - Epochs');xlabel('Epochs');ylabel('Cost');
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end),num_labels, (hidden_layer_size + 1));

X = [ones(m,1),X];
z2 = Theta1 * X';
a2 = sigmoid(z2);
a2 = [ones(1,m);a2];
z3 = Theta2 * a2;
hx = z3;
hx = hx';