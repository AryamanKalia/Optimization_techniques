clc
clear all
format short
%min x1+3x2+7x3
%2x1+3x2+4x3<=1
%x1+5x2+2x3<= 3
%2x1+4x2+3x3>=4
C=[ 1, 3, 7]
A=[2 3 4 ;1 5 2; 2 4 3 ]
b=[ 1;3 ; 4]
I=[0,0,1]
s=eye(size(A,1))
index= find(I>0)
s(index,index)=-s(index,index)
mat=[A s b]
obj=array2table(C);
obj.Properties.VariableNames(1:size(C,2))={'x_1','x_2','x_3'}
cons=array2table(mat);
cons.Properties.VariableNames(1:size(mat,2))={'x_1','x_2','x_3','s1','s2','s3','b'}