clc;clear;n=200;
X1 = load('data1.txt');
X2 = load('data2.txt');
X3 = load('data3.txt');
% figure(1);plot(X1(:,1),X1(:,2),'bx',X2(:,1),X2(:,2),'k.',X3(:,1),X3(:,2),'r+');
% xlabel('x1');ylabel('x2');title('Dataset');
X1=X1';X2=X2';X3=X3';
[mu1,sigma1]=get_mu_sigma(X1,n);
[mu2,sigma2]=get_mu_sigma(X2,n);
[mu3,sigma3]=get_mu_sigma(X3,n);
p1=0.35;p2=0.15;p3=0.5;
[x,y]=meshgrid(-6:0.02:6,-6:0.02:6);
P1 = pxy(x,y,mu1,sigma1); 
P2 = pxy(x,y,mu2,sigma2); 
P3 = pxy(x,y,mu3,sigma3); 
% figure(2);mesh(x,y,P1);hold on;mesh(x,y,P2);hold on;mesh(x,y,P3);
% xlabel('x1');ylabel('x2');zlabel('p(x|wi)');
% title('三类类条件概率p(x|wi)');
P1=P1*p1;P2=P2*p2;P3=P3*p3;Pall=P1+P2+P3;
P1=P1./Pall; P2=P2./Pall; P3=P3./Pall;
% figure(3);mesh(x,y,P1);hold on;mesh(x,y,P2);hold on;mesh(x,y,P3);hold on;
% xlabel('x1');ylabel('x2');zlabel('p(wi|x)');title('三类后验概率p(wi|x)');

region = cregion(x, P1, P2, P3, '1');
figure(4);mesh(x, y, region);
xlabel('x1');ylabel('x2');title('最小错误率决策边界');

r1 = 2*P2 + 8*P3; r2 = 3*P1 + 3*P3; r3 = 6*P2 + 18*P1; 
% figure(5);mesh(x, y, r1);hold on;mesh(x, y, r2);mesh(x, y, r3);
% xlabel('x1');ylabel('x2');title('决策损失');

region = cregion(x, r1, r2, r3, '2');
% figure(6);mesh(x, y, region);
% title('最小风险决策边界');xlabel('x1');ylabel('x2');