clear;clc;
[SL,SW,PL,PW,T] = textread('data.txt','%f%f%f%f%s',150,'delimiter',',');
data=[SL,SW,PL,PW];
n = length(T);
for i=1:n/3
    Type(i,1) = 1; Type(i+n/3,1) = 2; Type(i+2*n/3,1) = 3; 
end

[NodeNum,edge,E1,E2,g] = CNode(data,Type);%E1大于，E2小于
t1=find(data(:,NodeNum)<edge);t2=find(data(:,NodeNum)>edge);
data11 = data(t1,:);data12 = data(t2,:);
Type11 = Type(t1,:);Type12 = Type(t2,:);

[NodeNum_1,edge_1,E1_1,E1_2,g1] = CNode(data12,Type12);
t1=find(data12(:,NodeNum_1)<edge_1);t2=find(data12(:,NodeNum_1)>edge_1);
data21 = data12(t1,:);data22 = data12(t2,:);
Type21 = Type12(t1,:);Type22 = Type12(t2,:);

[NodeNum_21,edge_21,E1_21,E1_22,g21] = CNode(data22,Type22);
t1=find(data22(:,NodeNum_21)<edge_21);t2=find(data22(:,NodeNum_21)>edge_21);
data211 = data22(t1,:);data212 = data22(t2,:);
Type211 = Type22(t1,:);Type212 = Type22(t2,:);

[NodeNum_2,edge_2,E2_1,E2_2,g2] = CNode(data21,Type21);
t1=find(data21(:,NodeNum_2)<edge_2);t2=find(data21(:,NodeNum_2)>edge_2);
data31 = data21(t1,:);data32 = data21(t2,:);
Type31 = Type21(t1,:);Type32 = Type21(t2,:);

[NodeNum_3,edge_3,E3_1,E3_2,g3] = CNode(data32,Type32);
t1=find(data32(:,NodeNum_3)<edge_3);t2=find(data32(:,NodeNum_3)>edge_3);
data41 = data32(t1,:);data42 = data32(t2,:);
Type41 = Type32(t1,:);Type42 = Type32(t2,:);

t1=find(data32(:,NodeNum_3)<edge_3);t2=find(data32(:,NodeNum_3)>edge_3);
data41 = data32(t1,:);data42 = data32(t2,:);
Type41 = Type32(t1,:);Type42 = Type32(t2,:);
