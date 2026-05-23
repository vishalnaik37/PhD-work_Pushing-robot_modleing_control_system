 % 
clear all
Kp1=1000;Kp2=1000;
% Fd_=F_;
Ts=0.001;
K=load('W_Tip');
T0=K.out.WP01.time;
X0=K.out.WP01.signals(1).values;
Y0=K.out.WP01.signals(2).values;
alpha0=K.out.WP01.signals(3).values;

Xd0=K.out.WP02.signals(1).values;
Yd0=K.out.WP02.signals(2).values;
alpha_d0=K.out.WP02.signals(3).values;

Xdd0=K.out.WP03.signals(1).values;
Ydd0=K.out.WP03.signals(2).values;
alpha_dd0=K.out.WP03.signals(3).values;

T1=K.out.WP11.time+40+Ts;
X1=K.out.WP11.signals(1).values;
Y1=K.out.WP11.signals(2).values;
alpha1=K.out.WP11.signals(3).values;

Xd1=K.out.WP12.signals(1).values;
Yd1=K.out.WP12.signals(2).values;
alpha_d1=K.out.WP12.signals(3).values;

Xdd1=K.out.WP13.signals(1).values;
Ydd1=K.out.WP13.signals(2).values;
alpha_dd1=K.out.WP13.signals(3).values;

T2=K.out.WP21.time+2*40+2*Ts;
X2=K.out.WP21.signals(1).values;
Y2=K.out.WP21.signals(2).values;
alpha2=K.out.WP21.signals(3).values;

Xd2=K.out.WP22.signals(1).values;
Yd2=K.out.WP22.signals(2).values;
alpha_d2=K.out.WP22.signals(3).values;

Xdd2=K.out.WP23.signals(1).values;
Ydd2=K.out.WP23.signals(2).values;
alpha_dd2=K.out.WP23.signals(3).values;

T3=K.out.WP31.time+3*40+3*Ts;
X3=K.out.WP31.signals(1).values;
Y3=K.out.WP31.signals(2).values;
alpha3=K.out.WP31.signals(3).values;

Xd3=K.out.WP32.signals(1).values;
Yd3=K.out.WP32.signals(2).values;
alpha_d3=K.out.WP32.signals(3).values;

Xdd3=K.out.WP33.signals(1).values;
Ydd3=K.out.WP33.signals(2).values;
alpha_dd3=K.out.WP33.signals(3).values;


T=[T0',T1',T2',T3'];
X=[X0',X1',X2',X3'];
Y=[Y0',Y1',Y2',Y3'];
Alpha=[alpha0',alpha1',alpha2',alpha3']
P=[X;Y;Alpha];

Xd=[Xd0',Xd1',Xd2',Xd3'];
Yd=[Yd0',Yd1',Yd2',Yd3'];
Alphad=[alpha_d0',alpha_d1',alpha_d2',alpha_d3']
Pd=[Xd;Yd;Alphad];

Xdd=[Xdd0',Xdd1',Xdd2',Xdd3'];
Ydd=[Ydd0',Ydd1',Ydd2',Ydd3'];
Alphadd=[alpha_dd0',alpha_dd1',alpha_dd2',alpha_dd3'];
Pdd=[Xdd;Ydd;Alphadd];

[r,c]=size(P)
X=0.65;
% for p=1
% L1=0.5;
% L2=0.5;
% L01=0.5;
% h=0.0001;
% Z0=[0.1,0.2]';
% P0=P(:,p);
% q1=0;
% for n=1:20
%     t1=Z0(1);t2=Z0(2);
% PP=R_EQ(L01,L1,L2,q1,r,t1,t2)-P0(1:2);
% PPq1=R_EQ(L01,L1,L2,q1,r,t1+h,t2)-P0(1:2);
% PPq2=R_EQ(L01,L1,L2,q1,r,t1,t2+h)-P0(1:2);
% Jac=([PPq1 PPq2]-[PP PP])/h;
% Z1=Z0-inv(Jac)*PP;
% err=abs(Z1-Z0);
% if err<=0.0001
%     disp('completed');
%     break
% else Z0=Z1;
% end
% end
% Ang(:,p)=wrapToPi([t1;t2]);
% end
% Xc0=0;Xo=0.1;Yo=0.1;th0=0;q1=0;
% Pco =  R_EQO(X,Xc0,Xo,Yo,q1,r,t1,t2,th0);
% EqP = R_EQP(L01,L1,L2,X,Xc0,Xo,Yo,q1,r,t1,t2,th0);









for p=1
L1=0.5;
L2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2]';
P0=P(:,p);
q1=0;
Xc0=0;
Xo=0.1;Yo=0.1;th0=0;
for n=1:20
    t1=Z0(1);t2=Z0(2);
PP=[R_EQO(X,Xc0,Xo,Yo,q1,r,t1,t2,th0)];
PPq1=[R_EQO(X,Xc0,Xo,Yo,q1,r,t1+h,t2,th0)];
PPq2=[R_EQO(X,Xc0,Xo,Yo,q1,r,t1,t2+h,th0)];
Jac=([PPq1 PPq2]-[PP PP])/h;
Z1=Z0-inv(Jac)*PP;
err=abs(Z1-Z0);
if err<=0.0001
    disp('completed');
    break
else Z0=Z1;
end
end
Ang(:,p)=wrapToPi([t1;t2]);
end