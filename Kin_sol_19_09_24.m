
clear all
clc
L1=0.5;
L2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2,-0.1]';
% Z0=[0.1,0.2]'*0.0005;
Xo=0.1;Yo=0.1;r=0.01;
X10=0.55;X10_d=0;X10_dd=0;
q10=0*pi/180;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Ts=25;
for t=0:1:25
    k=k+1;
Xc0=0;
ts=Ts; 
q1s=4.4300*pi/180;
X1s=X10+0.07;
%X=0.65+n;q1=pi/10;
[q1,q1_d,q1_dd]=para_(q10,q10_d,q10_dd,t,ts,q1s);
[X,X_d,X_dd]=para_(X10,X10_d,X10_dd,t,ts,X1s);
Xc_d=0;Xc_dd=0;th0=0;
% Xc=0.04;
for n=1:100
    t1=Z0(1);t2=Z0(2);
    Xc=Z0(3);
    h=0.0001;
EqP  =[R_EQP(L01,L1,L2,X,Xc,Xo,Yo,q1,r,t1,t2);ForceClosure(Yo, q1, Xc,X, mu)];
Eqt1 =[R_EQP(L01,L1,L2,X,Xc,Xo,Yo,q1,r,t1+h,t2);ForceClosure(Yo, q1, Xc,X, mu)];
Eqt2 =[R_EQP(L01,L1,L2,X,Xc,Xo,Yo,q1,r,t1,t2+h);ForceClosure(Yo, q1, Xc,X, mu)];
EqXc =[R_EQP(L01,L1,L2,X,Xc+h,Xo,Yo,q1,r,t1,t2);ForceClosure(Yo, q1, Xc+h,X, mu)];
% EqP  =[R_EQP(L01,L1,L2,X,Xc,Xo,Yo,q1,r,t1,t2)];
% Eqt1 =[R_EQP(L01,L1,L2,X,Xc,Xo,Yo,q1,r,t1+h,t2)];
% Eqt2 =[R_EQP(L01,L1,L2,X,Xc,Xo,Yo,q1,r,t1,t2+h)];
% Jac=([Eqt1 Eqt2 ]-[EqP EqP])/h;
Jac=([Eqt1 Eqt2 EqXc]-[EqP EqP EqP])/h;

Z1=Z0-inv(Jac)*EqP;
err=abs(Z1-Z0);
if err<=0.0001 
    disp('completed')
    OD=X;AF=0.05;alpha=q1;
    Contact_Analysis(Yo, q1, Xc,X, mu)
    break
else 
    Z0=Z1;
end
end
t1=wrapToPi(t1);
t2=wrapToPi(t2);
Z0d=[0.1;0.2;0.3];
PP= R_EQ(L01,L1,L2,q1,r,t1,t2);
Pco = R_EQO(X,Xc,Xo,Yo,q1);

% for n=1:100
%     t1_d=Z0d(1);t2_d=Z0d(2);Xc_d=Z0d(3);
% VEqP = [R_VEQP(L1,L2,X_d,Xc,Xc_d,Xo,Yo,q1,q1_d,r,t1,t2,t1_d,t2_d);ForceClosure_d(Yo, q1, Xc,X, mu,Xc_d,q1_d)];
% VEqt1d = [R_VEQP(L1,L2,X_d,Xc,Xc_d,Xo,Yo,q1,q1_d,r,t1,t2,t1_d+h,t2_d);ForceClosure_d(Yo, q1, Xc,X, mu,Xc_d,q1_d)];
% VEqt2d = [R_VEQP(L1,L2,X_d,Xc,Xc_d,Xo,Yo,q1,q1_d,r,t1,t2,t1_d,t2_d+h);ForceClosure_d(Yo, q1, Xc,X, mu,Xc_d,q1_d)];
% VEqXcd = [R_VEQP(L1,L2,X_d,Xc,Xc_d+h,Xo,Yo,q1,q1_d,r,t1,t2,t1_d,t2_d);ForceClosure_d(Yo, q1, Xc,X, mu,Xc_d+h,q1_d)];
% Jac=([VEqt1d VEqt2d VEqXcd]-[VEqP VEqP VEqP])/h;
% Z1d=Z0d-inv(Jac)*VEqP;
% errd=abs(Z1d-Z0d);
% if errd<=0.0001;
%     disp('completed')
%     break
% else 
%     Z0=Z1;
% end
% end
% Z0dd=[0.1;0.2;0.3];
% 
% for n=1:100
%     t1_dd=Z0d(1);t2_dd=Z0d(2);Xc_dd=Z0d(3);
% AEqP = [R_AEQP(L1,L2,X_dd,Xc,Xc_d,Xc_dd,Xo,Yo,q1,q1_d,q1_dd,r,t1,t2,t1_d,t2_d,t1_dd,t2_dd);ForceClosure_dd(Yo, q1, Xc,X, mu,Xc_d,q1_d,Xc_dd,q1_dd)];
% AEqt1dd = [R_AEQP(L1,L2,X_dd,Xc,Xc_d,Xc_dd,Xo,Yo,q1,q1_d,q1_dd,r,t1,t2,t1_d,t2_d,t1_dd+h,t2_dd);ForceClosure_dd(Yo, q1, Xc,X, mu,Xc_d,q1_d,Xc_dd,q1_dd)];
% AEqt2dd =[R_AEQP(L1,L2,X_dd,Xc,Xc_d,Xc_dd,Xo,Yo,q1,q1_d,q1_dd,r,t1,t2,t1_d,t2_d,t1_dd,t2_dd+h);ForceClosure_dd(Yo, q1, Xc,X, mu,Xc_d,q1_d,Xc_dd,q1_dd)];
% AEqXcdd =[R_AEQP(L1,L2,X_dd,Xc,Xc_d,Xc_dd+h,Xo,Yo,q1,q1_d,q1_dd,r,t1,t2,t1_d,t2_d,t1_dd,t2_dd+h);ForceClosure_dd(Yo, q1, Xc,X, mu,Xc_d,q1_d,Xc_dd+h,q1_dd)];
% Jac=([AEqt1dd AEqt2dd AEqXcdd]-[ AEqP AEqP AEqP])/h;
% Z1dd=Z0dd-inv(Jac)*AEqP;
% errdd=abs(Z1dd-Z0dd);
% if errdd<=0.0001;
%     disp('completed')
%     break
% else 
%     Z0=Z1;
% end
% end
% Vco =R_Vco(X_d,Xc,Xo,Yo,q1,q1_d);
% Aco = R_Aco(X_dd,Xc,Xo,Yo,q1,q1_d,q1_dd);
% Q(:,k)=[wrapToPi(Z1);Pco(1:2);X;q1];
% Qd(:,k)=[Z1d;Vco(1:2);X_d;q1_d];
% Qdd(:,k)=[Z1dd;Aco(1:2);X_dd;q1_dd];
% T(k)=t;
% Q1(k)=q1;

th=(t1-t2)+pi/2-q1;
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
q11=[cos(q1) -sin(q1)  X;sin(q1) cos(q1) 0 ; 0 0 1];
q111=[0 -1 2*Xo;1 0 0;0 0 1];
q112=[0 -1 2*Yo;1 0 0;0 0 1];
q113=[0 -1 2*Xo;1 0 0;0 0 1];
q12=[cos(-q3+q4) -sin(-q3+q4) sqrt(Xo^2+Yo^2);sin(-q3+q4) cos(-q3+q4) 0;0 0 1];
Pco=q11*q12*[sqrt((Xc)^2+Yc1^2);0;1];

R=t12*t23*t34*[r;0;1];
P11=t12*[0;0;1];
P21=t12*t23*[0;0;1];
P31=t12*t23*t34*[0;0;1];
P41=t12*t23*t34*[r;0;1];
Q11=q11*[0;0;1];
Q12=q11*q111*[0;0;1];
Q13=q11*q111*q112*[0;0;1];
Q14=q11*q111*q112*q113*[0;0;1];
%%
hold on;
L11=line([P11(1) P21(1)],[P11(2) P21(2)]);
L21=line([P21(1) P31(1)],[P21(2) P31(2)]);
L31=line([P31(1) P41(1)],[P31(2) P41(2)]);
L41=line([Q11(1) Q12(1)],[Q11(2) Q12(2)]);
L51=line([Q12(1) Q13(1)],[Q12(2) Q13(2)]);
L61=line([Q13(1) Q14(1)],[Q13(2) Q14(2)]);
L71=line([Q14(1) Q11(1)],[Q14(2) Q11(2)]);
f=0:0.1:6.4;
t3=0;
a11=r;b11=r;
k1=double(a11*cos(f)*cos(t1+t2)-b11*sin(f)*sin(t1+t2)+P31(1));
k2=double(a11*cos(f)*sin(t1+t2)+b11*sin(f)*cos(t1+t2)+P31(2));
Ellipse1=plot(k1,k2,'color','k','LineWidth',2);
rectangle('Position',[0.82 0 0.02 0.02])
axis([-0.5 1 -0.5 1]);
axis equal;
grid on;
pause(0.01);
delete(L11);
delete(L21);
delete(L31);
delete(L41);
delete(L51);
delete(L61);
delete(L71);
delete(Ellipse1);
hold off;  










end
% plot(T,Q1)
% m1=0.6562;m2=0.1355;m3=0.1336;Kp1=10000;
% Kp2=10000;Kd1=10000;Kd2=110;
% Kd=2.8284;Kd1=141.42;Kd2=200;Kp=2;Kp1=5000;Kp2=10000;Kd2=110;

hold on;
L11=line([P11(1) P21(1)],[P11(2) P21(2)]);
L21=line([P21(1) P31(1)],[P21(2) P31(2)]);
L31=line([P31(1) P41(1)],[P31(2) P41(2)]);
L41=line([Q11(1) Q12(1)],[Q11(2) Q12(2)]);
L51=line([Q12(1) Q13(1)],[Q12(2) Q13(2)]);
L61=line([Q13(1) Q14(1)],[Q13(2) Q14(2)]);
L71=line([Q14(1) Q11(1)],[Q14(2) Q11(2)]);
f=0:0.1:6.4;
t3=0;
a11=r;b11=r;
k1=double(a11*cos(f)*cos(t1+t2)-b11*sin(f)*sin(t1+t2)+P31(1));
k2=double(a11*cos(f)*sin(t1+t2)+b11*sin(f)*cos(t1+t2)+P31(2));
Ellipse1=plot(k1,k2,'color','k','LineWidth',2);
rectangle('Position',[0.82 0 0.02 0.02])
axis([-0.5 1 -0.5 1]);
axis equal;
grid on;
hold off