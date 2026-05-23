
function [P11,P21,P31,P41,Q11,Q12,Q13,Q14,T,XC,VPP,APP,Pco,Time,Z1]=KinAnimation5(X10,q10,q1s,X1s,Ts,Y10,Y1s,Xc,Z0)
L1=0.5;
L2=0.5;
L01=0.5;
h=0.0001;

% Z0=[0.1,0.2]'*0.0005;
Xo=0.1;Yo=0.1;r=0.01;
X10_d=0;X10_dd=0;Y10_d=0;Y10_dd=0;
q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
for t=0:1:Ts
    k=k+1;
Xc0=0;
ts=Ts; 
[q1,q1_d,q1_dd]=para_(q10,q10_d,q10_dd,t,ts,q1s);
[X,X_d,X_dd]=para_(X10,X10_d,X10_dd,t,ts,X1s);
[Y,Y_d,Y_dd]=para_(Y10,Y10_d,Y10_dd,t,ts,Y1s);
Xc_d=0;Xc_dd=0;th0=0;
% Xc=0.04;
for n=1:50
    t1=Z0(1);t2=Z0(2);
    h=0.000001;
EqP  =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1,t2)];
Eqt1 =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1+h,t2)];
Eqt2 =[R_EQP(L01,L1,L2,X,Xc,Xo,Y,Yo,q1,r,t1,t2+h)];
Jac=([Eqt1 Eqt2]-[EqP EqP ])/h;
Z1=Z0-inv(Jac)*EqP;
err=abs(Z1-Z0);
if err<=0.0001 
    disp('completed')
    Contact_Analysis(Yo, q1, Xc,X, mu);
    break
else 
    Z0=Z1;
end
end
t1=t1;
t2=t2;
Z0d=[0.1;0.2;0.3];
PP= [R_EQ(L01,L1,L2,q1,r,t1,t2);0;0];
% PCO(:,t+1) = [ R_PCM(X,Xo,Y,Yo,q1);t1;t2;q1;X;Y;Xc];
Pco(:,t+1)=[R_EQO(X,Xc,Xo,Y,Yo,q1);t1;t2;q1;X;Y;Xc];

th=3*pi/2-t1-t2+q1;
t12=[cos(t1) -sin(t1)  0;sin(t1) cos(t1) L01  ; 0 0 1];
t23=[cos(t2) -sin(t2)  L1;sin(t2) cos(t2) 0  ; 0 0 1];
t34=[cos(th) -sin(th)  L2 ;sin(th) cos(th) 0  ; 0 0 1];
R=t12*t23*t34*[r;0;1];
Ro=t12*t23*t34*[r;0;1];x=Ro(1);y=Ro(2);
Yc1=Yo;
q4=atan2(Yc1,Xc);
q3=atan2(Yo,Xo);
JacF = R_JacF(L1,L2,t1,t2);
JacO = R_JacO(Xc,Xo,Yo,q1,r,t1,t2);
DD=inv(JacF)*JacO*[q1_d;X_d;Y_d];
t1_d=DD(1);t2_d=DD(2);
% VPP(:,t+1) = [R_VCM(X_d,Xo,Y_d,Yo,q1,q1_d);t1_d;t2_d;q1_d;X_d;Y_d;Xc_d];
VPP(:,t+1)=[R_Vco(X_d,Xc,Xo,Y_d,Yo,q1,q1_d);t1_d;t2_d;q1_d;X_d;Y_d;Xc_d];
JacFd = R_JacFd(L1,L2,t1,t2,t1_d,t2_d);
JacOd = R_JacOd(Xc,Xo,Yo,q1,q1_d,r,t1,t2);
DDD=inv(JacF)*(JacO*[q1_dd;X_dd;Y_dd]+JacOd*[q1_d;X_d;Y_d]-JacFd*[t1_d;t2_d]);
t1_dd=DDD(1);t2_dd=DDD(2);
% APP(:,t+1)=  [R_ACM(X_dd,Xo,Y_dd,Yo,q1,q1_d,q1_dd);t1_dd;t2_dd;q1_dd;X_dd;Y_dd;Xc_dd];
APP(:,t+1)=[R_Aco(X_dd,Xc,Xo,Y_dd,Yo,q1,q1_d,q1_dd);t1_dd;t2_dd;q1_dd;X_dd;Y_dd;Xc_dd];
% q2=-atan2(Yo,Xo);
% Xo and Yo- Position of cm of object
% q1- angle of tipping
% Xc and Yc1 are the position of point of contact relative to CM of object
q11=[cos(q1) -sin(q1)  X;sin(q1) cos(q1) Y; 0 0 1];
q111=[0 -1 2*Xo;1 0 0;0 0 1];
q112=[0 -1 2*Yo;1 0 0;0 0 1];
q113=[0 -1 2*Xo;1 0 0;0 0 1];
q12=[cos(-q3+q4) -sin(-q3+q4) sqrt(Xo^2+Yo^2);sin(-q3+q4) cos(-q3+q4) 0;0 0 1];
% Pco=q11*q12*[sqrt((Xc)^2+Yc1^2);0;1];
R=t12*t23*t34*[r;0;1];
P11(:,k)=t12*[0;0;1];
P21(:,k)=t12*t23*[0;0;1];
P31(:,k)=t12*t23*t34*[0;0;1];
P41(:,k)=t12*t23*t34*[r;0;1];
Q11(:,k)=q11*[0;0;1];
Q12(:,k)=q11*q111*[0;0;1];
Q13(:,k)=q11*q111*q112*[0;0;1];
Q14(:,k)=q11*q111*q112*q113*[0;0;1];
T(:,k)=wrapToPi([t1;t2]);
XC(:,k)=[Xc;0;0];
Time(:,k)=t;
end
% Data=[P11;P21;P31;P41;Q11;Q12;Q13;Q14;T];


