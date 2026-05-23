clear all
clc
L1=0.5;
L2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2,-0.1]';
% Z0=[0.1,0.2]'*0.0005;
Xo=0.1;Yo=0.1;r=0.01;
Y10_d=0;Y10_dd=0;
k=0; 
Xo=0.1;Yo=0.1;r=0.01;
mu=0.3;
Ts=20;
Xc0=0;
q1s=0;
X1s=0.79-sqrt(0.2^2-0.02^2);
Y10=0;Y1s=0;

X10=0.8;X10_d=0;X10_dd=0;
q10=0.3875;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
q1s=0;
X1s=0.8;
Y10=0.02;Y1s=0.02;

% X10=X1s;X10_d=0;X10_dd=0;
% q10=0;q10_d=0;q10_dd=0;
% k=0; 
% mu=0.3;
% Xc0=0;
% q1s=asin(0.02/0.2);
% X1s=0.79-sqrt(0.2^2-0.02^2);
for t=0:1:Ts
    k=k+1;
Xc0=0;
ts=Ts+1; 
[q1,q1_d,q1_dd]=para_(q10,q10_d,q10_dd,t,ts,q1s);
[X,X_d,X_dd]=para_(X10,X10_d,X10_dd,t,ts,X1s);
[Y,Y_d,Y_dd]=para_(Y10,Y10_d,Y10_dd,t,ts,Y1s);
Xc_d=0;Xc_dd=0;th0=0;
% Xc=0.04;
for n=1:100
    t1=Z0(1);t2=Z0(2);
    Xc=Z0(3);
    h=0.000001;
EqP  =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1,t2);ForceClosure(Y,Yo, q1, Xc,X, mu)];
Eqt1 =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1+h,t2);ForceClosure(Y,Yo, q1, Xc,X, mu)];
Eqt2 =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1,t2+h);ForceClosure(Y,Yo, q1, Xc,X, mu)];
EqXc =[R_EQP(L01,L1,L2,X,Xc+h,Xo,Y,Yo,q1,r,t1,t2);ForceClosure(Y,Yo, q1, Xc+h,X, mu)];
Jac=([Eqt1 Eqt2 EqXc]-[EqP EqP EqP])/h;

Z1=Z0-inv(Jac)*EqP;
err=abs(Z1-Z0);
if err<=0.0001 
    disp('completed')
    OD=X;AF=0.05;alpha=q1;
    Contact_Analysis(Yo, q1, Xc,X, mu);
    break
elseif inv(Jac)==NaN
        break;

else 
    Z0=Z1;
end
end
t1=wrapToPi(t1);
t2=wrapToPi(t2);
Z0d=[0.1;0.2;0.3];
PP= R_EQ(L01,L1,L2,q1,r,t1,t2);
Pco = R_EQO(X,Xc,Xo,Y,Yo,q1);
% th=-(t1-t2)-3*pi/2+2*q1;
% th=(t1-t2)-pi/2-q1;
% th=(pi/2+t1-t2+q1);
% th=-(t1+t2+pi)+pi/2-q1;
% th=pi/2+t1+t2+q1
th=3*pi/2-t1-t2+q1;

t12=[cos(t1) -sin(t1)  0;sin(t1) cos(t1) L01  ; 0 0 1];
t23=[cos(t2) -sin(t2)  L1;sin(t2) cos(t2) 0  ; 0 0 1];
t34=[cos(th) -sin(th)  L2 ;sin(th) cos(th) 0  ; 0 0 1];
R=t12*t23*t34*[r;0;1];

Yc1=Yo;
q4=atan2(Yc1,Xc);
q3=atan2(Yo,Xo);
% q2=-atan2(Yo,Xo);
% Xo and Yo- Position of cm of object
% q1- angle of tipping
% Xc and Yc1 are the position of point of contact relative to CM of object
q11=[cos(q1) -sin(q1)  X;sin(q1) cos(q1) Y; 0 0 1];
q111=[0 -1 2*Xo;1 0 0;0 0 1];
q112=[0 -1 2*Yo;1 0 0;0 0 1];
q113=[0 -1 2*Xo;1 0 0;0 0 1];
q12=[cos(-q3+q4) -sin(-q3+q4) sqrt(Xo^2+Yo^2);sin(-q3+q4) cos(-q3+q4) 0;0 0 1];

% q11=[cos(q1+q3) -sin(q1+q3)  X;sin(q1+q3) cos(q1+q3) Y ; 0 0 1];
% q12=[cos(-q3+q4) -sin(-q3+q4) sqrt(Xo^2+Yo^2);sin(-q3+q4) cos(-q3+q4) 0;0 0 1];

Pco=R_EQO(X,Xc,Xo,Y,Yo,q1);
R=t12*t23*t34*[r;0;1];
P11(:,t+1)=t12*[0;0;1];
P21(:,t+1)=t12*t23*[0;0;1];
P31(:,t+1)=t12*t23*t34*[0;0;1];
P41(:,t+1)=t12*t23*t34*[r;0;1];
Q11(:,t+1)=q11*[0;0;1];
Q12(:,t+1)=q11*q111*[0;0;1];
Q13(:,t+1)=q11*q111*q112*[0;0;1];
Q14(:,t+1)=q11*q111*q112*q113*[0;0;1];
T(:,t+1)=wrapToPi([t1;t2]);
XC(:,t+1)=[Xc;0;0];
end