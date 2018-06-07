clear;clc;clf;
X1 = load('data1.txt');
X2 = load('data2.txt');
x1_1 = [X1(:,1),X1(:,2)]; %y1=[X1(:,3)];
x2_1 = [X2(:,1),X2(:,2)]; %y2=[X2(:,3)];
n=200;
alpha = 1;
for i=1:n
   x1(i,:)=x1_1(200-(n/2)+i,:);
   x2(i,:)=x2_1(200-(n/2)+i,:);
end
for i=1:n
   x1(i,2)=x1(i,2)+10;
   x2(i,2)=x2(i,2)-10;
end
plot(x1(:,1),x1(:,2),'bx',x2(:,1),x2(:,2),'k.');
title('Dataset(400 Samples)');
 xlabel('x1');
 ylabel('x2');
hold on;
n1=size(x1,1);
n2=size(x2,1);
x11=[ones(n1,1) x1];
x21=[ones(n2,1) x2];
x21 = -x21;
x = [x11;x21]';
theta = [1;1;1];
count = 0;
j = 1;
for i=1:10000000
    if(theta' * x(:,j) <= 0 )
        theta = theta + alpha * x(:,j);
        count = 0;
    else
        theta = theta;
        count = count + 1;
    end
    j=j+1;
    if(j == (n1+n2+1))
        j = 1;
    end
    if(count == (n1+n2+1))
        break;
    end
end
l1=-20:0.01:20;
l2 = ( -theta(2)*l1 - theta(1) )/theta(3);
plot(l1,l2,'r');