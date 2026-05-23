clear all
clc


syms X2 X3 X_d2 X_d3 X_dd2 X_dd3 X_d0 X_d1 X_dd0 X_dd1 t0 X0 X1 X2 X3 t1 t2 t3 t a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 a34 a35 a36 real

% P=[a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15 a16 a17 a18 a19 a20 a21 a22 a23 a24 a25 a26 a27 a28 a29 a30 a31 a32 a33 a34 a35];
% T=[1 t t^2 t^3 t^4 t^5 t^6 t^7 t^8 t^9 t^10 t^11 t^12 t^13 t^14 t^15 t^16 t^17 t^18 t^19 t^20 t^21 t^22 t^23 t^24 t^25 t^26 t^27 t^28 t^29 t^30 t^31 t^32 t^33 t^34 t^35]

P=[a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 ];
T=[1 t t^2 t^3 t^4 t^5 t^6 t^7 t^8 t^9 t^10 t^11];

X=P*T';
X_d=diff(X,t);
% matlabFunction(X_d,'file','R_Xd','Optimize',false);
X_dd=diff(X_d,t);
% matlabFunction(X_dd,'file','R_Xdd','Optimize',false);


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



E1=subs(X,t,t0)-X0;
E2=subs(X,t,t1)-X1;
E3=subs(X_d,t,t0)-X_d0;
E4=subs(X_d,t,t1)-X_d1;
E5=subs(X_dd,t,t0)-X_dd0;
E6=subs(X_dd,t,t1)-X_dd1;

E7=subs(X,t,t2)-X2;
E8=subs(X,t,t3)-X3;
E9=subs(X_d,t,t2)-X_d2;
E10=subs(X_d,t,t3)-X_d3;
E11=subs(X_dd,t,t2)-X_dd2;
E12=subs(X_dd,t,t3)-X_dd3;

% matlabFunction([E1;E2;E3;E4;E5;E6;E7;E8;E9;E10;E11;E12],'file','R_Poly_Eq','Optimize',false);
E=[E1;E2;E3;E4;E5;E6;E7;E8;E9;E10;E11;E12];
% S=solve(E,P);
