clear;clc;
X1_1 = load('data1.txt');
X2_1 = load('data2.txt');
n=400;
alpha = 1;
for i=1:n
   X1(i,:)=X1_1(200-(n/2)+i,:);
   X2(i,:)=X2_1(200-(n/2)+i,:);
end
x1 = [X1(:,1),X1(:,2)]; y1=zeros(n,1);
x2 = [X2(:,1),X2(:,2)]; y2=[X2(:,3)];
plot(x1(:,1),x1(:,2),'bx',x2(:,1),x2(:,2),'k.');
title('Dataset(400 Samples)');
xlabel('x1');
ylabel('x2');
hold on;
X = [x1;x2];
X = [ones(2*n,1),X];
y = [y1;y2];
initial_theta = [0;0;0];
%  options = optimset('GradObj', 'on', 'MaxIter',20);
%  [theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);
theta = gradientDescent(X, y, initial_theta, alpha, 1470)

l1=-20:0.01:20;
l2 = ( -theta(2)*l1 - theta(1) )/theta(3);
plot(l1,l2,'r');