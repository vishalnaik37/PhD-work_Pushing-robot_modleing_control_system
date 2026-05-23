

syms Lamda1 Lamda2 y Xdd real
mus=0.3;
mo=1.6;
g=-9.81
Xdd=0.02;
Mo=[mo 0;0 mo];
mu=0.2;n=1/sqrt(mus^2+1);
G=[0 mu;0 1];
Pi=[n^2 0;0 n^2-1];
Q=orth(G);P1=Lamda1*Pi;
F=pinv(G)*(Mo*[Xdd;0]+[mu*(mo*g);mo*g]);
Fo=F+Q;
Pb=[0 Lamda2];
Qi=eye(2)-P1;
g1=(F+Q*y)'*Pi*(F+Q*y);
g2=[0 ,1]*(F+Q*y);
E1=Lamda1*g1+Lamda2*g2
E2=y+inv(Q'*Qi*Q)*(F'*Qi*Q-0.5*Pb*Q);
S=solve([E1;E2],[y,Lamda1,Lamda2])