%function [feature, category]=generate_sample(step,error)
aa=3.42; %Ð±ÂÊ
bb=3.73; %½Ø¾à
b1=1;  
rr =20;
s=0.1;
x1(:,1) = -20:s:20;
n = length(x1(:,1));
x1(:,2) = aa.*x1(:,1) + bb + b1 + rr*abs(randn(n,1));
y1 = -ones(n,1);
x2(:,1) =  -20:s:20;
x2(:,2) = aa.*x2(:,1) + bb - b1 - rr*abs(randn(n,1));
y2 = ones(n,1);
figure;
plot(x1(:,1),x1(:,2),'bx',x2(:,1),x2(:,2),'k.');
X1=[x1,y1];
X2=[x2,y2];
feature=[x1;x2];
category=[y1;y2];