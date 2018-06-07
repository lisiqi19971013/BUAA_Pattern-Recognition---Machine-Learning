clc;clear;
x1=[-3.9847,-3.5549,-1.2401,-0.9780,-0.7932,-2.8531,-2.7605,-3.7287,...
    -3.5414,-2.2692,-3.4549,-3.0752,-3.9934, -0.9780,-1.5799,-1.4885,...
    -0.7431,-0.4221,-1.1186,-2.3462,-1.0826,-3.4196,-1.3193,-0.8367,-0.6579,-2.9683];
x2=[2.8792, 0.7932,1.1882,3.0682,4.2532,0.3271,0.9846,2.7648,2.6588];
[mu1,sigma1]=normfit(x1);
[mu2,sigma2]=normfit(x2);


%x=0.75332;
x = -10:0.01:10;
for i=1:2001
    p1(i) = 0.9*normpdf(x(i), mu1, sigma1)/(0.9*normpdf(x(i), mu1, sigma1)+0.1*normpdf(x(i), mu2, sigma2));
    p2(i) = 0.1*normpdf(x(i), mu2, sigma2)/(0.9*normpdf(x(i), mu1, sigma1)+0.1*normpdf(x(i), mu2, sigma2));
    r1(i) = 1 * p2(i);
    r2(i) = 6 * p1(i);
end
plot(x,r1,'g');hold on;
title('决策损失');
xlabel('x');
ylabel('R(ai|x)');
plot(x,r2,'r');hold on;
x=1.4026;
line([x,x],[0,6]);
gtext('R(a1|x)');
gtext('R(a2|x)');
gtext('决策边界');
  
%  y1 = normpdf(x, mu1, sigma1);
%  y2 = normpdf(x, mu2, sigma2);
% subplot(1,2,1);
%  plot(x,y1);hold on;
%  title('类条件概率P(x|wi)');
%  xlabel('x');
%  ylabel('P(x|wi)');
% subplot(1,2,2);
%  plot(x,y2);
%  gtext('P(x|w1)');
%  gtext('P(x|w2)');
% title('类条件概率P(x|w2)');
% xlabel('x');
% ylabel('P(x|w2)');
