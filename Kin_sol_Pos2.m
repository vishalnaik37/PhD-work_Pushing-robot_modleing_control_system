 % 
clear all
X10=0;X10_d=0;X10_dd=0;
Y10=0;Y10_d=0;Y10_dd=0;
Z10=0;Z10_d=0;Z10_dd=0;
p=0;
    ts=0.5;
    Ts0=ts;
for t=0:0.1:ts
    p=p+1;
    X10=0.65;Y10=0.22;Z10=1;
    X1s=0.65;Y1s=0.2;Z1s=0.1;
[X11,X11_d,X11_dd]=para_(X10,X10_d,X10_dd,t,ts,X1s);
[Y11,Y11_d,Y11_dd]=para_(Y10,Y10_d,Y10_dd,t,ts,Y1s);
[Z11,Z11_d,Z11_dd]=para_(Z10,Z10_d,Z10_dd,t,ts,Z1s);
X110(:,p)=X11;
Y110(:,p)=Y11;
Z110(:,p)=Z11;
X11d0(:,p)=X11_d;
Y11d0(:,p)=Y11_d;
Z11d0(:,p)=Z11_d;
X11dd0(:,p)=X11_dd;
Y11dd0(:,p)=Y11_dd;
Z11dd0(:,p)=Z11_dd;
T110(p)=t;
F01(p)=0;
end
% Fd_=F_;
% P0=[X110;Y110];
% P0d=[X11d0;Y11d0];
% P0_dd=[X11dd0;Y11dd0];
Kp1=1000;Kp2=1000;
% Fd_=F_;
P011=[X110;Y110;F01];
Ts=0.001;
K=load('W_Point');
T1=K.out.WP11.time+40+Ts+Ts0;
X1=K.out.WP11.signals(1).values;
Y1=K.out.WP11.signals(2).values;
F1=K.out.WP11.signals(3).values;
Xd1=K.out.WP21.signals(1).values;
Yd1=K.out.WP21.signals(2).values;
Fd1=K.out.WP21.signals(3).values;
Xdd1=K.out.WP31.signals(1).values;
Ydd1=K.out.WP31.signals(2).values;
Fdd1=K.out.WP31.signals(3).values;
T0=K.out.WP10.time+Ts0+0.1;
X0=K.out.WP10.signals(1).values;
Y0=K.out.WP10.signals(2).values;
F0=K.out.WP10.signals(3).values;
Xd0=K.out.WP20.signals(1).values;
Yd0=K.out.WP20.signals(2).values;
Fd0=K.out.WP20.signals(3).values;
Xdd0=K.out.WP30.signals(1).values;
Ydd0=K.out.WP30.signals(2).values;
Fdd0=K.out.WP30.signals(3).values;
T2=K.out.WP12.time+80+2*Ts+Ts0;
X2=K.out.WP12.signals(1).values;
Y2=K.out.WP12.signals(2).values;
F2=K.out.WP12.signals(3).values;
Xd2=K.out.WP22.signals(1).values;
Yd2=K.out.WP22.signals(2).values;
Fd2=K.out.WP22.signals(3).values;
Xdd2=K.out.WP32.signals(1).values;
Ydd2=K.out.WP32.signals(2).values;
Fdd2=K.out.WP32.signals(3).values;

T=[T110,T0'];
X=[X110,X2'];
Y=[Y110,Y2'];
F_=[F01,F1']
P=[X;Y;F_];
Xd=[X11d0,Xd2'];
Yd=[Y11d0,Yd2'];
Fd_=F_;
Pd=[Xd;Yd;Fd_];
Xdd=[X11dd0,Xdd2'];
Ydd=[Y11dd0,Ydd2'];
Fdd_=F_;
Pdd=[Xdd;Ydd;Fdd_];
[r,c]=size(P)
for p=1:c
a1=0.5;
a2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2]';
P0=P(:,p);
for n=1:20
    q1=Z0(1);q2=Z0(2);
PP=R_EQ(L01,a1,a2,0,r,q1,q2)-P0(1:2);
PPq1=R_EQ(L01,a1,a2,0,r,q1+h,q2)-P0(1:2);
PPq2=R_EQ(L01,a1,a2,0,r,q1,q2+h)-P0(1:2);
Jac=([PPq1 PPq2]-[PP PP])/h;
Z1=Z0-inv(Jac)*PP;
err=abs(Z1-Z0);
if err<=0.0001
    disp('completed');
    break
else Z0=Z1;
end
end
Ang(:,p)=wrapToPi([q1;q2]);
end
 Kp1=5000;Kp2=10000;
 % An=wrapToPi(Ang(1:2,102:40001));
 % Kd=0;
[r,c]=size(P011)
for p=1:c
a1=0.5;
a2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2]';
P01=P(:,p);
for n=1:20
    q1=Z0(1);q2=Z0(2);
PP=R_EQ(L01,a1,a2,0,r,q1,q2)-P01(1:2);
PPq1=R_EQ(L01,a1,a2,0,r,q1+h,q2)-P01(1:2);
PPq2=R_EQ(L01,a1,a2,0,r,q1,q2+h)-P01(1:2);
Jac=([PPq1 PPq2]-[PP PP])/h;
Z1=Z0-inv(Jac)*PP;
err=abs(Z1-Z0);
if err<=0.0001
    disp('completed');
    break
else Z0=Z1;
end
end
Ang1(:,p)=wrapToPi([q1;q2]);
end
P0d=[X11d0;Y11d0;F01];
P0dd=[X11dd0;Y11dd0;F01];
m1=0;m2=0;d1=0;d2=0;k1=20;k2=4;
Kp=10;
Kd1=2*sqrt(Kp1);Kd2=2*sqrt(Kp2);Kd=2*sqrt(Kp);
Kd = 2.8284;
Kd1 = 141.42;
Kd2 = 200;
Kp = 2;
Kp1 = 5000;
Kp2 = 10000;
m1=0.6562;m2=0.1355;m3=0.1336;Kp1=10000;
Kp2=10000;Kd1=10000;Kd2=110;
Kd=2.8284;Kd1=141.42;Kd2=200;Kp=2;Kp1=5000;Kp2=10000;Kd2=110;



    