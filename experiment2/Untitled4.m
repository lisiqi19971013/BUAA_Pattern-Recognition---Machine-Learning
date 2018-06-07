X1 = load('data1.txt');
X2 = load('data2.txt');
X3 = load('data3.txt');
X1=X1';X2=X2';X3=X3';
n=200;
[mu1,sigma1]=get_mu_sigma(X1,n);
[mu2,sigma2]=get_mu_sigma(X2,n);
[mu3,sigma3]=get_mu_sigma(X3,n);
p1=0.35;p2=0.15;p3=0.5;
X1=X1';X2=X2';X3=X3';
[x, y] = meshgrid(-6 : 0.05 : 6);
% figure(1);
% hold on;
mean1 = mean(X1);
cov1 = cov(X1(:, 1), X1(:, 2));
mean2 = mean(X2);
cov2 = cov(X2(:, 1), X2(:, 2));
mean3 = mean(X3);
cov3 = cov(X3(:, 1), X3(:, 2));
ph1 = reshape(mvnpdf([x(:), y(:)], mean1, cov1), size(x));
ph2 = reshape(mvnpdf([x(:), y(:)], mean2, cov2), size(x));
ph3 = reshape(mvnpdf([x(:), y(:)], mean3, cov3), size(x));
% surf(x, y, ph1);hold on;surf(x, y, ph2);surf(x, y, ph3);

P1 = p1* ph1; P2 = p2* ph2; P3 = p3* ph3;
Pall=P1+P2+P3;
P1=P1./Pall; P2=P2./Pall; P3=P3./Pall;
% surf(x, y, P1);hold on;surf(x, y, P2);surf(x, y, P3);hold on;

% region = cregion(x, P1, P2, P3, '1');
% surf(x, y, region);
% xlabel('x1');ylabel('x2');title('最小错误率决策边界');

r1 = 6*P2 + 2*P3; r2 = 3*P1 + 3*P3; r3 = 6*P2 + 2*P1; 
% mesh(x, y, r1);hold on;mesh(x, y, r2);mesh(x, y, r3);
region = cregion(x, r1, r2, r3, '2');
mesh(x, y, region);
title('最小风险决策边界');xlabel('x1');ylabel('x2');