
a=3.42; 
b=-3.73; 
c=-4.21;
d=-2.4;
n = 400;
X = 20*randn(n,3);
j1=1; j2=1;
for i=1:n
   if(a*X(i,1)+b*X(i,2)+c*X(i,3)+d>0)
      x1(j1,:)=X(i,:);
      j1=j1+1;
   elseif(a*X(i,1)+b*X(i,2)+c*X(i,3)+d<0)
      x2(j2,:)=X(i,:);
      j2=j2+1; 
   end
end
 figure;
 plot3(x1(:,1),x1(:,2),x1(:,3),'bx',x2(:,1),x2(:,2),x2(:,3),'k.');
