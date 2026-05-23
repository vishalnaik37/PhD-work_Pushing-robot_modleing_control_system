 % 
clear all


X10=0;X10_d=0;X10_dd=0;
Y10=0;Y10_d=0;Y10_dd=0;
Z10=0;Z10_d=0;Z10_dd=0;
p=0;
for t=0:0.1:10
    p=p+1;
    ts=10
    X10=0.65;Y10=0.3;Z10=1;
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
P0=[X110;Y110;F01];


Ts=0.001;
K=load('W_Point');
T1=K.out.WP11.time+40+Ts+10;
X1=K.out.WP11.signals(1).values;
Y1=K.out.WP11.signals(2).values;
F1=K.out.WP11.signals(3).values;
Xd1=K.out.WP21.signals(1).values;
Yd1=K.out.WP21.signals(2).values;
Fd1=K.out.WP21.signals(3).values;
Xdd1=K.out.WP31.signals(1).values;
Ydd1=K.out.WP31.signals(2).values;
Fdd1=K.out.WP31.signals(3).values;

T0=K.out.WP10.time+10+0.1;
X0=K.out.WP10.signals(1).values;
Y0=K.out.WP10.signals(2).values;
F0=K.out.WP10.signals(3).values;
Xd0=K.out.WP20.signals(1).values;
Yd0=K.out.WP20.signals(2).values;
Fd0=K.out.WP20.signals(3).values;
Xdd0=K.out.WP30.signals(1).values;
Ydd0=K.out.WP30.signals(2).values;
Fdd0=K.out.WP30.signals(3).values;

T2=K.out.WP12.time+80+2*Ts+10;
X2=K.out.WP12.signals(1).values;
Y2=K.out.WP12.signals(2).values;
F2=K.out.WP12.signals(3).values;
Xd2=K.out.WP22.signals(1).values;
Yd2=K.out.WP22.signals(2).values;
Fd2=K.out.WP22.signals(3).values;
Xdd2=K.out.WP32.signals(1).values;
Ydd2=K.out.WP32.signals(2).values;
Fdd2=K.out.WP32.signals(3).values;


% T=[T0',T1',T2'];
% X=[X0',X1',X2'];
% Y=[Y0',Y1',Y2'];
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
Fdd_=F_;;
Pdd=[Xdd;Ydd;Fdd_];

% P=[X2';Y2';F2'];
% Pd=[Xd2';Yd2';Fd2'];
% Pdd=[Xdd2';Ydd2';Fdd2']
% T=K.out.WP11.time'
Ki=0.1;
Kd=0.5;
Kpf=0.5;
Kif=(1+Kpf)*log(10^4);
Kp=16;
kd=0.5;
Kp1=10;
Kd1=1;

% s1=9007
% s2=0.7459
% B=0.01;
% Kfp=0.01;
% Kfi=-(Kfp)*log((s2/B))/(t+0.001);
% y=s1*Kfi+s2*Kfi;
% 
% 
% 
% syms x
% E1=log(x)-x;
% S=solve(E1,x)
Kp=700;
Kif=50;
D2=6800;
D1=4500;
K1=0.26;
K2=1.33;

a1=0.5;
a2=0.5;
L01=0.5;
L2=0.5;
L1=0.5;
Z0=[1,2]'*0.003;
h=0.0001;
Y=P(:,1);
r=0.01;
for n=1:20
    q1=Z0(1);
    q2=Z0(2);

PP=R_EQ1(L01,a1,a2,r,q1,q2)-Y(1:2);
PPq1=R_EQ1(L01,a1,a2,r,q1+h,q2)-Y(1:2);
PPq2=R_EQ1(L01,a1,a2,r,q1,q2+h)-Y(1:2);
Jac=([PPq1 PPq2]-[PP PP])/h;
Z1=Z0-inv(Jac)*PP;
err=abs(Z1-Z0);
if err<=0.0001
    disp('completed');
    break;
else Z0=Z1
end
end
%Final_Reciprocating_Simscape_13_08_24
Kp=100;
