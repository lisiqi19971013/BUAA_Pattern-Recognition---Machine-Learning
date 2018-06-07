function [J, grad] = costFunction(theta, X, y)
m = length(y); 
J = 0;
grad = zeros(size(theta));
[n,p] = size(theta);

sum = 0;
A = X*theta;
for i=1:m
   sum = sum +  ( -y(i)*log( sigmoid( A(i) ) ) - (1 - y(i))*log( 1-sigmoid( A(i) ) ) );
end
J=sum/m;

for j=1:n
    sum1=0;
    for i=1:m
       sum1 = sum1+(sigmoid( A(i) )-y(i))*X(i,j);
    end
    grad(j) = sum1/m;
end
end
