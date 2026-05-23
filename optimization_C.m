% q2=q2-0.1;
clear all
clc 
syms y1 y2 y3 y4 mu_s L1 L2 L3 L4 Xdd y1 y2 y3 y4 mu_k real
mo=1.6;
Mo=[mo 0; 0 0];
G=[1 0 1 0;0 1 0 1];
Xdd=0.0001;
Fo=Mo*[Xdd;0];
mu_s=0.3;
mu_k=0.1;
y=[y1;y2;y3;y4];
Q=(eye(4)-pinv(G)*G)
Fd=pinv(G)*Fo+Q*y;
% Fd1=[mu_s*Fd(2);Fd(2)];
% L=Fd'*Fd+L1*L1*(mu_s^2*Fd(2)*Fd(2)-Fd(1)*Fd(1))+L2*L2*Fd(4)*Fd(4);
% Jac_L=(jacobian(L,[y1,y2,y3,y4]))';
% S=solve(Jac_L,[y1,y2,y3,y4]);

P1=((1/sqrt(1+mu_s^2)*eye(2,2))-[0 0;0 1]);
P2=((1/sqrt(1+mu_k^2)*eye(2,2))-[0 0;0 1]);
g1=[Fd(1) Fd(2)]*P1*[Fd(1);Fd(2)]
g2=[Fd(3) Fd(4)]*P2*[Fd(3);Fd(4)]
g3=[0 1]*[Fd(1);Fd(2)];
g4=[0 -1]*[Fd(3);Fd(4)];

L=subs(Fd'*Fd-L1*g1+L2*g2-L3*g3-L4*g4,[y1,y2],[y3,y4]);

JacL=jacobian(L,[y4,y3,L1,L2]);

S=solve(JacL,[y4,y3,L1,L2]);

Pa=[L1*P1 zeros(2,2);zeros(2,2) L2*P2];
Pb=[L3*[0,1],L4*[0,-1]];
QI=eye(4)-Pa;

y=inv((eye(4)-pinv(G)*G))*inv(QI)*(0.5*Pb'-QI'*pinv(G)*Fo);
K=subs(y,[L1,L2,L3,L4],[10^-5,10^-5,10^-5,10^-5])