clear ll
clc
syms fx fy m xdd ydd mu mus g y1 y2 real

G=[1 -mus;0 0];
Q=eye(2)-pinv(G)*G;
y=[y1;y2];
Fc=simplify(pinv(G)*([m*xdd;m*ydd]+G*[-mus*m*g;0])+Q*y);
EQ=Fc(2)-Fc(1)/mu;
S=solve(EQ,y2);
Fcd=simplify(pinv(G)*([m*xdd;m*ydd]+G*[-mus*m*g;0])+Q*[y1;S]);
matlabFunction(Fcd,'file','R_Fcd','Optimize',false)
