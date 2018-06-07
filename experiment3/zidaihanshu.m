clear;clc;
[SL,SW,PL,PW,T] = textread('data.txt','%f%f%f%f%s',150,'delimiter',',');
data=[SL,SW,PL,PW];
Tree=fitctree([SL,SW,PL,PW],T);
view(Tree,'Mode','graph');