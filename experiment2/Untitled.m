clc;clear;
x1=[-3.9847,-3.5549,-1.2401,-0.9780,-0.7932,-2.8531,-2.7605,-3.7287,...
    -3.5414,-2.2692,-3.4549,-3.0752,-3.9934, -0.9780,-1.5799,-1.4885,...
    -0.7431,-0.4221,-1.1186,-2.3462,-1.0826,-3.4196,-1.3193,-0.8367,-0.6579,-2.9683];
x2=[2.8792, 0.7932,1.1882,3.0682,4.2532,0.3271,0.9846,2.7648,2.6588];
[mu1,sigma1]=normfit(x1);
[mu2,sigma2]=normfit(x2);

ezplot('0*y-x+0.75332');hold on;axis([-10 10 0 1]);

x = -10:0.01:10;
y1 = 0.9*normpdf(x, mu1, sigma1)./(0.9*normpdf(x, mu1, sigma1)+0.1*normpdf(x, mu2, sigma2));
y2 = 0.1*normpdf(x, mu2, sigma2)./(0.9*normpdf(x, mu1, sigma1)+0.1*normpdf(x, mu2, sigma2));
plot(x,y1);hold on;
plot(x,y2);hold on;
xlabel('x');
ylabel('P(wi|x)');
title('最小错误率贝叶斯决策边界');
gtext('P(w1|x)');
gtext('P(w2|x)');
gtext('E1=E2');