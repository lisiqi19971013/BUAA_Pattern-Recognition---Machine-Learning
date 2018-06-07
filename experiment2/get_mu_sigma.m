function [mu,sigma]=get_mu_sigma(X,n)
mu=0;
for i=1:n
    mu = mu + X(:,i);
end
mu = mu ./ n; 
sigma = [0 0;0 0];
for i=1:n
   sigma = sigma + (X(:,i)-mu)*(X(:,i)-mu)' ;
end
sigma = sigma ./ n;
end