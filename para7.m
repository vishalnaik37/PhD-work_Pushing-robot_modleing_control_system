clear all
clc
syms a0 a1 a2 a3 a4 a5 a6 a7 t th t1 th0 th1 t0 th0d th1d th_d th_dd th0dd th1dd real

E1=a0+a1*t+a2*t^2+a3*t^3+a4*t^4+a5*t^5+a6*t^6-th;
E11=subs(E1,[t,th],[t0,th0]);
E12=subs(E1,[t,th],[t1,th1]);

E2d=diff(E1,t)+diff(E1,th)*th_d;
E2d1=subs(E2d,[t,th_d],[t0,th0d]);
E2d2=subs(E2d,[t,th_d],[t1,th1d]);

E3d=diff(E2d,t)+diff(E1,th_d)*th_dd;
E3d1=subs(E3d,[t,th_dd],[t0,th0dd]);
E3d2=subs(E3d,[t,th_dd],[t1,th1dd]);

EQ=[E11;E12;E2d1;E2d2;E3d1;E3d2];
P=solve(EQ,[a0,a1,a2,a3,a4,a5,a6])