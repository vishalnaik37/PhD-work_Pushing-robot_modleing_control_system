 % 
clear all

% t0=0;
% t1=40;
% t2=42;
% t3=80;
% X0=0.1;
% X_d0=0;
% X_dd0=0;
% X1=0.065;
% X_d1=0;
% X_dd1=0;
% X2=0.065;
% X_d2=0;
% X_dd2=0;
% X3=0.085;
% X_d3=0;
% X_dd3=0;
% Y0=0.05;
% Y_d0=0;
% Y_dd0=0;
% Y1=0.02-0.001;
% Y_d1=0;
% Y_dd1=0;
% Y2=0.02;
% Y_d2=0;
% Y_dd2=0;
% Y3=0.02;
% Y_d3=0;
% Y_dd3=0;
% t=t0;
% 
% 
% 
% h=0.0001;
% Z0=[1,2,3,4,5,6,7,8,9,10,11,12]'*0.0001;
% for n=1:20
% a0=Z0(1);
% a1=Z0(2);
% a2=Z0(3);
% a3=Z0(4);
% a4=Z0(5);
% a5=Z0(6);
% a6=Z0(7);
% a7=Z0(8);
% a8=Z0(9);
% a9=Z0(10);
% a10=Z0(11);
% a11=Z0(12);
% 
% E=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
% E0=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0+h,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
% E1=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1+h,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
% E2=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2+h,a3,a4,a5,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
% E3=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3+h,a4,a5,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
% E4=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4+h,a5,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
% E5=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5+h,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
% E6=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6+h,a7,a8,a9,a10,a11,t0,t1,t2,t3);
% E7=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6,a7+h,a8,a9,a10,a11,t0,t1,t2,t3);
% E8=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6,a7,a8+h,a9,a10,a11,t0,t1,t2,t3);
% E9=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9+h,a10,a11,t0,t1,t2,t3);
% E10=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10+h,a11,t0,t1,t2,t3);
% E11=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11+h,t0,t1,t2,t3);
% 
% Jac=vpa(([E0 E1 E2 E3 E4 E5 E6 E7 E8 E9 E10 E11]-[E E E E E E E E E E E E])/h,13);
% Z1=Z0-inv(Jac)*E;
% err=abs(Z1-Z0);
%  if err<=0.001;
%      disp('comnpleted')
%      break;
%  else
%      Z0=Z1;
%  end
% end
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
