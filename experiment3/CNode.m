function [NodeNum,edge,E1,E2,g]=CNode(data,Type)
    EntD=CEntD(Type);
    [m,n]=size(data);
    Gain=EntD*ones(1,n);
    for i=1:n
        data1=data(:,i);
        A1=unique(data1);
        n1=length(A1);
        for j=1:n1-1
            A(j)=(A1(j)+A1(j+1))/2;
        end
        A=A(1:n1-1);
        for p=1:length(A)
            t1=find(data1>A(p));t2=find(data1<A(p));
            type1 = Type(t1);type2 = Type(t2);
            Ent1(p) =  CEntD(type1)*length(type1)/m;
            Ent2(p) = CEntD(type2)*length(type2)/m;
            G(p) = EntD - Ent1(p) - Ent2(p);
        end
        G = G(1:n1-1);
        [Y,I] = max(G);
        Gain(i) = Y;
        edge(i) = A(I);
        E1(i) = Ent1(I);E2(i) = Ent2(I);
    end
    [Y,I] = max(Gain);
    g = Y;
    NodeNum = I;
    edge = edge(I);
    E1= E1(I);E2 = E2(I);
end