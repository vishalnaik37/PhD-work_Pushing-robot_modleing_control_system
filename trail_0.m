 % 
clear all

Ts=0.001;
K=load('W_Point');
T1=K.out.WP11.time+40+Ts;
X1=K.out.WP11.signals(1).values;
Y1=K.out.WP11.signals(2).values;
F1=K.out.WP11.signals(3).values;
Xd1=K.out.WP21.signals(1).values;
Yd1=K.out.WP21.signals(2).values;
Fd1=K.out.WP21.signals(3).values;
Xdd1=K.out.WP31.signals(1).values;
Ydd1=K.out.WP31.signals(2).values;
Fdd1=K.out.WP31.signals(3).values;

T0=K.out.WP10.time;
X0=K.out.WP10.signals(1).values;
Y0=K.out.WP10.signals(2).values;
F0=K.out.WP10.signals(3).values;
Xd0=K.out.WP20.signals(1).values;
Yd0=K.out.WP20.signals(2).values;
Fd0=K.out.WP20.signals(3).values;
Xdd0=K.out.WP30.signals(1).values;
Ydd0=K.out.WP30.signals(2).values;
Fdd0=K.out.WP30.signals(3).values;

T2=K.out.WP12.time+80+2*Ts;
X2=K.out.WP12.signals(1).values;
Y2=K.out.WP12.signals(2).values;
F2=K.out.WP12.signals(3).values;
Xd2=K.out.WP22.signals(1).values;
Yd2=K.out.WP22.signals(2).values;
Fd2=K.out.WP22.signals(3).values;
Xdd2=K.out.WP32.signals(1).values;
Ydd2=K.out.WP32.signals(2).values;
Fdd2=K.out.WP32.signals(3).values;


T=[T0',T1',T2'];
X=[X0',X1',X2'];
Y=[Y0',Y1',Y2'];
F_=[F0',F1',F2']
P=[X;Y;F_];

Xd=[Xd0',Xd1',Xd2'];
Yd=[Yd0',Yd1',Yd2'];
Fd_=[Fd0',Fd1',Fd2'];
Pd=[Xd;Yd;Fd_];

Xdd=[Xdd0',Xdd1',Xdd2'];
Ydd=[Ydd0',Ydd1',Ydd2'];
Fdd_=[Fdd0',Fdd1',Fdd2'];
Pdd=[Xdd;Ydd;Fdd_];

P=[X2';Y2';F2'];
Pd=[Xd2';Yd2';Fd2'];
Pdd=[Xdd2';Ydd2';Fdd2']
T=K.out.WP11.time'
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
t10=q1;t20=q2;