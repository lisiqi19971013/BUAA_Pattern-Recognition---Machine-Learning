clear ; close all; clc
input_layer_size  = 4;  
hidden_layer_size = 5; 
num_labels = 3;   
[SL,SW,PL,PW,T] = textread('data.txt','%f%f%f%f%s',150,'delimiter',',');
X=[SL,SW,PL,PW];
testX = [X(41:50,:);X(91:100,:);X(141:150,:)];
X = [X(1:40,:);X(51:90,:);X(101:140,:)];
m = size(X, 1);
n = length(T);
y = zeros(m,1);
for i=1:n/3
    y(i,1) = 1; y(i+n/3,1) = 2; y(i+2*n/3,1) = 3; 
end
testY = [y(41:50,:);y(91:100,:);y(141:150,:)];
y = [y(1:40,:);y(51:90,:);y(101:140,:)];
initial_nn_params = load('initialTheta.txt');

% data = load('wdbc.txt');
% input_layer_size  = 30;
% hidden_layer_size = 35;
% num_labels = 2;
% X = data(:,1:30);
% y = data(:,31);y=y+1;
% testX = X(int32(size(X, 1) * 0.8) + 1 : end, :);
% X = X(1 : int32(size(X, 1) * 0.8), :);
% testY = y(int32(size(y, 1) * 0.8) + 1 : end, :);
% y = y(1 : int32(size(y, 1) * 0.8), :);
% m = size(X, 1);
% initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
% initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
% initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

nn_params = initial_nn_params;
lambda = 1;
% ep = 100;
% options = optimset('MaxIter', ep);
% costFunction = @(p) nnCostFunction(p,input_layer_size,hidden_layer_size,num_labels, X, y, lambda);
% [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);


alpha1 = 0.1;%alpha2 = 0.1;alpha3 = 0.5;alpha4 = 5;alpha5 = 10;
ep = 3000;
cost1 = zeros(1,ep);cost2 = zeros(1,ep);cost3 = zeros(1,ep);cost4 = zeros(1,ep);Acc1 = zeros(1,ep);Acc2 = zeros(1,ep);
for i=1:ep
    [cost1(i),grad] = nnCostFunction(nn_params,input_layer_size,hidden_layer_size,num_labels, X, y, lambda);
    nn_params = nn_params - alpha1 * grad;
    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
    Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end),num_labels, (hidden_layer_size + 1));
    pred1= predict(Theta1, Theta2, testX);%测试集正确率
    Acc1(i) = mean(double(pred1 == testY)) * 100;
    pred2= predict(Theta1, Theta2, X);%训练集正确率
    Acc2(i) = mean(double(pred2 == y)) * 100;    
end

% nn_params1 = initial_nn_params;
% for i=1:ep
%     [cost2(i),grad] = nnCostFunction(nn_params1,input_layer_size,hidden_layer_size,num_labels, X, y, lambda);
%     nn_params1 = nn_params1 - alpha2 * grad;
% end
% nn_params2 = initial_nn_params;
% for i=1:ep
%     [cost3(i),grad] = nnCostFunction(nn_params2,input_layer_size,hidden_layer_size,num_labels, X, y, lambda);
%     nn_params2 = nn_params2 - alpha3 * grad;
% end
% nn_params3 = initial_nn_params;
% for i=1:ep
%     [cost4(i),grad] = nnCostFunction(nn_params3,input_layer_size,hidden_layer_size,num_labels, X, y, lambda);
%     nn_params3 = nn_params3 - alpha4 * grad;
% end
% nn_params4 = initial_nn_params;
% for i=1:ep
%     [cost5(i),grad] = nnCostFunction(nn_params4,input_layer_size,hidden_layer_size,num_labels, X, y, lambda);
%     nn_params4 = nn_params4 - alpha5 * grad;
% end

i=1:ep;
figure(1);plot(i,cost1);%hold on;plot(i,cost2);hold on;plot(i,cost3);hold on;plot(i,cost4);hold on;plot(i,cost5);
title('Cost - Epochs');xlabel('Epochs');ylabel('Cost');%legend('0.01','0.1','0.5','5','10');
figure(2);plot(i,100-Acc1,'r');hold on;plot(i,100-Acc2,'b');legend('Test data','Train data');
title('Classification Error - Epochs');xlabel('Epochs');ylabel('Classification Error/%');


Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end),num_labels, (hidden_layer_size + 1));
pred = predict(Theta1, Theta2, X);
fprintf('Training Set Accuracy: %f\n', mean(double(pred == y)) * 100);
pred1= predict(Theta1, Theta2, testX);%测试集正确率
fprintf('Testing Set Accuracy: %f\n', mean(double(pred1 == testY)) * 100);

% Theta1 = reshape(nn_params1(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
% Theta2 = reshape(nn_params1((1 + (hidden_layer_size * (input_layer_size + 1))):end),num_labels, (hidden_layer_size + 1));
% pred = predict(Theta1, Theta2, X);
% fprintf('a=0.1:Training Set Accuracy: %f\n', mean(double(pred == y)) * 100);
% pred1= predict(Theta1, Theta2, testX);%测试集正确率
% fprintf('a=0.1:Testing Set Accuracy: %f\n', mean(double(pred1 == testY)) * 100);
% 
% Theta1 = reshape(nn_params2(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
% Theta2 = reshape(nn_params2((1 + (hidden_layer_size * (input_layer_size + 1))):end),num_labels, (hidden_layer_size + 1));
% pred = predict(Theta1, Theta2, X);
% fprintf('a=0.5:Training Set Accuracy: %f\n', mean(double(pred == y)) * 100);
% pred1= predict(Theta1, Theta2, testX);%测试集正确率
% fprintf('a=0.5:Testing Set Accuracy: %f\n', mean(double(pred1 == testY)) * 100);
% 
% Theta1 = reshape(nn_params3(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
% Theta2 = reshape(nn_params3((1 + (hidden_layer_size * (input_layer_size + 1))):end),num_labels, (hidden_layer_size + 1));
% pred = predict(Theta1, Theta2, X);
% fprintf('a=5:Training Set Accuracy: %f\n', mean(double(pred == y)) * 100);
% pred1= predict(Theta1, Theta2, testX);%测试集正确率
% fprintf('a=5:Testing Set Accuracy: %f\n', mean(double(pred1 == testY)) * 100);
% 
% Theta1 = reshape(nn_params4(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
% Theta2 = reshape(nn_params4((1 + (hidden_layer_size * (input_layer_size + 1))):end),num_labels, (hidden_layer_size + 1));
% pred = predict(Theta1, Theta2, X);
% fprintf('a=10:Training Set Accuracy: %f\n', mean(double(pred == y)) * 100);
% pred1= predict(Theta1, Theta2, testX);%测试集正确率
% fprintf('a=10:Testing Set Accuracy: %f\n', mean(double(pred1 == testY)) * 100);
