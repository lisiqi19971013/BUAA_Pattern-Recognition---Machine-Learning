function EntD = CEntD(x)
EntD = 0;
TotalNum = length(x);
A = unique(x);
PropertyNum = length(A);
for i=1:PropertyNum
    n1=length(find(x==A(i)));
    p1=n1/TotalNum;
    EntD=EntD-p1*log2(p1);
end
end