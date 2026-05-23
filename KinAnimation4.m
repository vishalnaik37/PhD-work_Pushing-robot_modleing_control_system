
function [P11,P21,P31,P41,Q11,Q12,Q13,Q14,T,Q,VPP,APP,Pco,Time,Z1]=KinAnimation4(X10,X1s,Ts,Y10,Y1s,x4,y4,Z0)
L1=0.5;
L2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2,-0.1,0.3]';
% Z0=[0.1,0.2]'*0.0005;
Xo=0.1;Yo=0.1;r=0.01;
X10_d=0;X10_dd=0;Y10_d=0;Y10_dd=0;
q10_d=0;q10_dd=0;
mu=0.3;
for t=0:1:Ts
Xc0=0;
ts=Ts; 
% [q1,q1_d,q1_dd]=para_(q10,q10_d,q10_dd,t,ts,q1s);
[X,X_d,X_dd]=para_(X10,X10_d,X10_dd,t,ts,X1s);
[Y,Y_d,Y_dd]=para_(Y10,Y10_d,Y10_dd,t,ts,Y1s);
Xc=-0.1;Xc_d=0;Xc_dd=0;th0=0;
% Xc=0.04;
for n=1:100
    t1=Z0(1);t2=Z0(2);
   q1=Z0(3);X1=Z0(4);
    h=0.000001;
EqP  =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1,t2);X+X1*cos(q1)-x4;Y+X1*sin(q1)-y4];
Eqt1 =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1+h,t2);X+X1*cos(q1)-x4;Y+X1*sin(q1)-y4];
Eqt2 =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1,t2+h);X+X1*cos(q1)-x4;Y+X1*sin(q1)-y4];
% EqXc =[R_EQP(L01,L1,L2,X,Xc+h,Xo,Y,Yo,q1,r,t1,t2);ForceClosure(Yo, q1, Xc+h,X, mu);Xo1+X1*cos(q1)-x4;X1*sin(q1)-y4];
Eqq1 =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1+h,r,t1,t2);X+X1*cos(q1+h)-x4;Y+X1*sin(q1+h)-y4];
EqX1 =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1,t2);X+(X1+h)*cos(q1)-x4;Y+(X1+h)*sin(q1)-y4];
% EqP  =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1,t2);ForceClosure(Y,Yo, q1, Xc,X, mu);X+X1*cos(q1)-x4;Y+X1*sin(q1)-y4];
% Eqt1 =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1+h,t2);ForceClosure(Y,Yo, q1, Xc,X, mu);X+X1*cos(q1)-x4;Y+X1*sin(q1)-y4];
% Eqt2 =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1,t2+h);ForceClosure(Y,Yo, q1, Xc,X, mu);X+X1*cos(q1)-x4;Y+X1*sin(q1)-y4];
% EqXc =[R_EQP(L01,L1,L2,X,Xc+h,Xo,Y,Yo,q1,r,t1,t2);ForceClosure(Y,Yo, q1, Xc+h,X, mu);X+X1*cos(q1)-x4;X1*sin(q1)-y4];
% Eqq1 =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1+h,r,t1,t2);ForceClosure(Y,Yo, q1, Xc,X, mu);X+X1*cos(q1+h)-x4;Y+X1*sin(q1+h)-y4];
% EqX1 =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1,t2);ForceClosure(Y,Yo, q1, Xc,X, mu);X+(X1+h)*cos(q1)-x4;Y+(X1+h)*sin(q1)-y4];
Jac=([Eqt1 Eqt2 Eqq1 EqX1]-[EqP EqP EqP EqP])/h;
Z1=Z0-inv(Jac)*EqP;
err=abs(Z1-Z0);
if err<=0.0001 
    % disp('completed')
    OD=X;AF=0.05;alpha=q1;
    Contact_Analysis(Yo, q1, Xc,X, mu);
    break
else 
    Z0=Z1;
end
end
t1=wrapToPi(t1);
t2=wrapToPi(t2);
Z0d=[0.1;0.2;0.3];
PP= [R_EQ(L01,L1,L2,q1,r,t1,t2);0;0];
% Pco = R_EQO(X,Xc,Xo,Y,Yo,q1);
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
% Pco(:,t+1) = [R_PCM(X,Xo,Y,Yo,q1);t1;t2;q1;X;Y;Xc];
Pco(:,t+1)=[R_EQO(X,Xc,Xo,Y,Yo,q1);t1;t2;q1;X;Y;Xc];
Yc1=Yo;
q4=atan2(Yc1,Xc);
q3=atan2(Yo,Xo);

% JacF = Jac;
% JacO = ([[R_EQP(L01,L1,L2,X+h,Xc,Xo,Y,Yo,q1,r,t1,t2);X+X1*cos(q1)-x4;Y+X1*sin(q1)-y4],[R_EQP(L01,L1,L2,X,Xc,Xo,Y+h,Yo,q1,r,t1,t2);X+X1*cos(q1)-x4;Y+X1*sin(q1)-y4]]-[EqP,EqP])/h
% DD=-inv(JacF)*JacO*[X_d;Y_d];
% t1_d=DD(1);t2_d=DD(2);q1_d=DD(3);Xc_d=DD(4);

% JacF1 = R_JacF(L1,L2,t1,t2);
% JacO1 = R_JacO(Xc,Xo,Yo,q1,r,t1,t2);
JacF2 = R_JacF2(L1,L2,X1,Xc,Xo,Yo,q1,r,t1,t2);
JacO2 = R_JacO2;
DD=-inv(JacF2)*JacO2*[X_d;Y_d];
t1_d=DD(1);t2_d=DD(2);q1_d=DD(3);X1_d=DD(4);
JacF2d = R_JacFd2(L1,L2,X1,X1_d,Xc,Xo,Yo,q1,q1_d,r,t1,t2,t1_d,t2_d);
DDD=inv(JacF2)*(JacO2*[X_dd;Y_dd]-JacF2d*[t1_d;t2_d;q1_d;Xc_d]);
t1_dd=DDD(1);t2_dd=DDD(2);q1_dd=DD(3);X1_dd=DD(4);

% APP(:,t+1)= R_AEQP(L1,L2,X_dd,Xc,Xc_d,Xc_dd,Xo,Y_dd,Yo,q1,q1_d,q1_dd,r,t1,t2,t1_d,t2_d,t1_dd,t2_dd);
% VPP(:,t+1)=[R_VCM(X_d,Xo,Y_d,Yo,q1,q1_d);t1_d;t2_d;q1_d;X_d;Y_d;Xc_d];
VPP(:,t+1)=[R_Vco(X_d,Xc,Xo,Y_d,Yo,q1,q1_d);t1_d;t2_d;q1_d;X_d;Y_d;Xc_d];

% APP(:,t+1)=[R_ACM(X_dd,Xo,Y_dd,Yo,q1,q1_d,q1_dd);t1_dd;t2_dd;q1_dd;X_dd;Y_dd;Xc_dd]
APP(:,t+1)=[R_Aco(X_dd,Xc,Xo,Y_dd,Yo,q1,q1_d,q1_dd);t1_dd;t2_dd;q1_dd;X_dd;Y_dd;Xc_dd];

% q2=-atan2(Yo,Xo);
% Xo and Yo- Position of cm of object
% q1- angle of tipping
% Xc and Yc1 are the position of point of contact relative to CM of object
q11=[cos(q1) -sin(q1)  X;sin(q1) cos(q1) Y ; 0 0 1];
q111=[0 -1 2*Xo;1 0 0;0 0 1];
q112=[0 -1 2*Yo;1 0 0;0 0 1];
q113=[0 -1 2*Xo;1 0 0;0 0 1];
q12=[cos(-q3+q4) -sin(-q3+q4) sqrt(Xo^2+Yo^2);sin(-q3+q4) cos(-q3+q4) 0;0 0 1];
% Pco=q11*q12*[sqrt((Xc)^2+Yc1^2);0;1];
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
Q(t+1)=q1;
Time(:,t+1)=t;
end
% Data=[P11;P21;P31;P41;q11;q12;q13;q14;T];


