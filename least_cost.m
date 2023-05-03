clc
clear all
Cost = [11 20 7 8; 21 7 10 12; 8 12 18 9];
A = [50 50 60];
B = [ 25 25 40 70];
% cost = [19 30 50 10; 70 30 40 60; 40 8 70 20];
% supply = [7;9;18];
% demand = [ 5 8 7 14];

ICost = Cost
X = zeros(size(Cost))
for i=1:size(Cost,1)
    for j=1:size(Cost,2)
        hh=min(Cost(:))
        [rowind, colind]=find(hh==Cost)
        x11=min(A(rowind),B(colind))
        [val,ind]=max(x11)
        ii=rowind(ind)
        jj=colind(ind)
        y11=min(A(ii),B(jj))
        X(ii,jj)=y11
        A(ii)=A(ii)-y11
        B(jj)=B(jj)-y11
        Cost(ii,jj)=inf
    end
end
Initialcost=sum(sum(ICost.*X)
