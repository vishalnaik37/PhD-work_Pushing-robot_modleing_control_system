clear all
clc
L1=0.5;
L2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2]'*0.5;
Xo=0.1;Yo=0.1;r=0.02;
X10=0.65;X10_d=0;X10_dd=0;
q10=0;q10_d=0;q10_dd=0;
k=0; 
for t=0
    k=k+1;
Xc0=0;
ts=40; 
q1s=pi/10;
X1s=0.65;
%X=0.65+n;q1=pi/10;
[q1,q1_d,q1_dd]=para_(q10,q10_d,q10_dd,t,ts,q1s);
[X,X_d,X_dd]=para_(X10,X10_d,X10_dd,t,ts,X1s);
Xc_d=0;Xc_dd=0;th0=0;
for n=1:100
    t1=Z0(1);t2=Z0(2);h=0.0001;
EqP =  R_EQP(L01,L1,L2,X,Xc0,Xo,Yo,q1,r,t1,t2,th0);
Eqt1 = R_EQP(L01,L1,L2,X,Xc0,Xo,Yo,q1,r,t1+h,t2,th0);
Eqt2 =  R_EQP(L01,L1,L2,X,Xc0,Xo,Yo,q1,r,t1,t2+h,th0);
Jac=([Eqt1 Eqt2]-[EqP EqP])/h;
Z1=Z0-inv(Jac)*EqP;
err=abs(Z1-Z0);
if err<=0.0001;
    disp('completed')
    OD=X;AF=0.05;alpha=q1;
    Contact_Analysis(OD,AF,alpha);
    break
else 
    Z0=Z1;
end
end
% t1=wrapToPi(t1);
% t2=wrapToPi(t2);
% Z0d=[0.1;0.2];
PP=R_EQ(L01,L1,L2,q1,r,t1,t2)
Pco = R_EQO(X,Xc0,Xo,Yo,q1,r,t1,t2,th0)

% for n=1:100
%     t1_d=Z0d(1);t2_d=Z0d(2);
% VEqP = R_VEQP(L1,L2,X_d,Xc0,Xo,Yo,q1,q1_d,r,t1,t2,t1_d,t2_d,th0);
% VEqt1d = R_VEQP(L1,L2,X_d,Xc0,Xo,Yo,q1,q1_d,r,t1,t2,t1_d+h,t2_d,th0);
% VEqt2d = R_VEQP(L1,L2,X_d,Xc0,Xo,Yo,q1,q1_d,r,t1,t2,t1_d,t2_d+h,th0);
% Jac=([VEqt1d VEqt2d]-[VEqP VEqP])/h;
% Z1d=Z0d-inv(Jac)*VEqP;
% errd=abs(Z1d-Z0d);
% if errd<=0.0001;
%     disp('completed')
%     break
% else 
%     Z0=Z1;
% end
% end
% Z0dd=[0.1;0.2];
% for n=1:100
%     t1_dd=Z0d(1);t2_dd=Z0d(2);
% AEqP =   R_AEQP(L1,L2,X_dd,Xc0,Xo,Yo,q1,q1_d,q1_dd,r,t1,t2,t1_d,t2_d,t1_dd,t2_dd,th0);
% AEqt1dd =  R_AEQP(L1,L2,X_dd,Xc0,Xo,Yo,q1,q1_d,q1_dd,r,t1,t2,t1_d,t2_d,t1_dd+h,t2_dd,th0);
% AEqt2dd =   R_AEQP(L1,L2,X_dd,Xc0,Xo,Yo,q1,q1_d,q1_dd,r,t1,t2,t1_d,t2_d,t1_dd,t2_dd+h,th0);
% Jac=([AEqt1dd AEqt2dd]-[ AEqP AEqP])/h;
% Z1dd=Z0dd-inv(Jac)*AEqP;
% errdd=abs(Z1dd-Z0dd);
% if errdd<=0.0001;
%     disp('completed')
%     break
% else 
%     Z0=Z1;
% end
% end
% Vco =  R_Vco(X_d,Xc0,Xo,Yo,q1,q1_d,r,t1,t2,t1_d,t2_d,th0);
% Aco =  R_Aco(X_dd,Xc0,Xo,Yo,q1,q1_d,q1_dd,r,t1,t2,t1_d,t2_d,t1_dd,t2_dd,th0);
% Q(:,k)=[wrapToPi(Z1);Pco(1:2);X;q1];
% Qd(:,k)=[Z1d;Vco(1:2);X_d;q1_d];
% Qdd(:,k)=[Z1dd;Aco(1:2);X_dd;q1_dd];
% T(k)=t;
% Q1(k)=q1;
% end
% plot(T,Q1)
% m1=0.6562;m2=0.1355;m3=0.1336;Kp1=10000;
% Kp2=10000;Kd1=10000;Kd2=110;
% Kd=2.8284;Kd1=141.42;Kd2=200;Kp=2;Kp1=5000;Kp2=10000;Kd2=110;
end