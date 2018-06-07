function Z = pxy(X,Y,mu,sigma)
DX=sigma(1,1);     %X的方差
dx=sqrt(DX);
DY=sigma(2,2);     %Y的方差
dy=sqrt(DY);
COV=sigma(1,2);    %X Y的协方差
r=COV/(dx*dy);
part1=1/(2*pi*dx*dy*sqrt(1-r^2));
p1=-1/(2*(1-r^2));
px=(X-mu(1)).^2./DX;
py=(Y-mu(2)).^2./DY;
pxy=2*r.*(X-mu(1)).*(Y-mu(2))./(dx*dy);
Z=part1*exp(p1*(px-pxy+py));
end