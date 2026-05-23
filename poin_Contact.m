clear all
clc
syms x1 x0 y1 y0 th1 real
th=30;
th1=0;
x0=0.65;y0=0;
u=tand(th)
e12=[x1-x0;y1-y0];
n1=[tan(th1); -1];
Eq=acos(e12'*n1)-atan(0.3);
P=solve(Eq,[x1,y1])
X1=vpa(P.x1,3)