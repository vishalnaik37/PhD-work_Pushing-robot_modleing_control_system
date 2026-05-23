
function [X,X_d,X_dd]=Poly_Xsolve(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,t0,t1,t2,t3,t)
h=0.0001;
Z0=[1,2,3,4,5,6,7,8,9,10,11,12]';
for n=1:100
a0=Z0(1);
a1=Z0(2);
a2=Z0(3);
a3=Z0(4);
a4=Z0(5);
a5=Z0(6);
a6=Z0(7);
a7=Z0(8);
a8=Z0(9);
a9=Z0(10);
a10=Z0(11);
a11=Z0(12);

E=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
E0=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0+h,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
E1=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1+h,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
E2=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2+h,a3,a4,a5,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
E3=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3+h,a4,a5,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
E4=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4+h,a5,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
E5=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5+h,a6,a7,a8,a9,a10,a11,t0,t1,t2,t3);
E6=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6+h,a7,a8,a9,a10,a11,t0,t1,t2,t3);
E7=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6,a7+h,a8,a9,a10,a11,t0,t1,t2,t3);
E8=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6,a7,a8+h,a9,a10,a11,t0,t1,t2,t3);
E9=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9+h,a10,a11,t0,t1,t2,t3);
E10=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10+h,a11,t0,t1,t2,t3);
E11=R_Poly_Eq(X0,X1,X2,X3,X_d0,X_d1,X_d2,X_d3,X_dd0,X_dd1,X_dd2,X_dd3,a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11+h,t0,t1,t2,t3);

Jac=(([E0 E1 E2 E3 E4 E5 E6 E7 E8 E9 E10 E11]-[E E E E E E E E E E E E])/h)*10^13;
Z1=Z0-inv(Jac)*E*10^13;
err=abs(Z1-Z0)
 if err<=0.001;
     break;
 else
     Z0=Z1;
 end
end

P=[a0 a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 ];
T=[1 t t^2 t^3 t^4 t^5 t^6 t^7 t^8 t^9 t^10 t^11];
X=P*T';

X_d = R_Xd(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,t);
X_dd = R_Xdd(a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,t);
