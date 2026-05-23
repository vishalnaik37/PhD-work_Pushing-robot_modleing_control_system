clear all
syms Fe(t) Kfi Kfp Kd Kp Ki e(t)

ode=Kfp*diff(Fe,t)+Kfi*Fe
cond= Fe(0)==10^-4;
cond_=Fe(40)==10^-4;
FeSol(t) = dsolve(ode,cond)


cond1=e(0)==10^-4
ode2=diff(e,t,3)+Kd*diff(e,t,2)+Kp*diff(e,t,1)+Ki*e
eSol(t) = dsolve(ode2,cond1)
% N=subs(eSol(t),e,0)
% K=solve(N,Kp)
