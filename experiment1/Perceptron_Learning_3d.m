clear;clc;
x1_1 = load('data1_3.txt');
x2_1 = load('data2_3.txt');
n=100;
alpha = 1;
for i=1:n
   x1(i,:)=x1_1(98-(n/2)+i,:);
   x2(i,:)=x2_1(103-(n/2)+i,:);
end
% plot3(x1(:,1),x1(:,2),x1(:,3),'bx',x2(:,1),x2(:,2),x2(:,3),'k.');hold on;
% title('Dataset(400 samples)');
% xlabel('x1');
% ylabel('x2');
% zlabel('x3');
n1=size(x1,1);
n2=size(x2,1);
x1=[ones(n1,1) x1];
x2=[ones(n2,1) x2];
x2 = -x2;
x = [x1;x2]';
theta = [0;0;0;0];
count = 0;

j = 1;
for i=1:1000000
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
%  syms l1 l2;
%  ezsurf(-(theta(1)+theta(2)*l1+theta(3)*l2)/theta(4),[-60,60,-60,60]);
%  title('Dataset(400 samples)');
%  xlabel('x1');
% ylabel('x2');
% zlabel('x3');

