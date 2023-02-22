clc
clear all
A=[1 1;1 2;1 3;1 4; 0 1;1 0];
B=[1; 3; 4; 5; 0;0];
c=[30 40];

y=0:0.11:max(B)
x11=(B(1)-A(1,1).*y)./A(1,2);
x21=(B(2)-A(2,1).*y)./A(2,2);
x31=(B(3)-A(3,1).*y)./A(3,2);
x41=(B(4)-A(4,1).*y)./A(4,2);
x51=(B(5)-A(5,1).*y)./A(5,2);
x11=max(0,x11);
x21=max(0,x21);
x31=max(0,x31);
x41=max(0,x41);
x51=max(0,x51);

plot(y,x11,'r',y,x21,'b',y,x31,'g',y,x41,'k',y,x51,'k')
title('x1 vs x2')
xlabel('value of x1')
ylabel('value of x2')

pt=[];
for i =1:6
    A1=A(i,:);
    B1=B(i,:);
    for j=i+1:6
        A2=A(j,:);
        B2=B(j,:);
        A4=[A1;A2];
        B4=[B1;B2];
        X=A4\B4;
        %X=max(0,X)
        pt=[pt X]
    end 
end 
x=pt'
%x=unique(x,'rows')x=pt'

x1=x(:,1);
x2=x(:,2);
const1=(x1+x2-1)
s1=find(const1>0)
x(s1,:)=[]

x1=x(:,1);
x2=x(:,2);
const2=((2.*x2)+x1-3)
s2=find(const2>0)
x(s2,:)=[]

x1=x(:,1);
x2=x(:,2);
const3=(x1+(3.*x2)-4)
s3=find(const3>0)
x(s3,:)=[]

x1=x(:,1);
x2=x(:,2);
const4=(x1+(4.*x2)-5)
s4=find(const4>0)
x(s4,:)=[]

x1=x(:,1);
x2=x(:,2);
const5=(x1) 
s5=find(const5<0)
x(s5,:)=[]

x1=x(:,1);
x2=x(:,2);
const6=(x2) 
s6=find(const6<0)
x(s6,:)=[]
x

output=x
for i=1:size(x,1)
    fn(i,:)=(sum(x(i,:).*c))
end
ver_ans=[x fn]
[ optval,optpos]=max(fn)