clear all
clc
syms L2 L1 y x t1 t2 y1 y2 y3 alpha2 alpha1 X1 Y1 X Y Xc1 real
Xc0=0.2/2;
X=0.65;
r=0.01;
Yc1=0.1;
th0=-pi/3;
q1=0.3;
t1=0.3778;t2=-1.5670;
G=R_Grasp(Xc0,Yc1,q1,r,t1,t2,th0);
mus=0.1;
Mo=0.18;
Fn1=2;Io=0.12;X_dd=0.03;Y_dd=0;q1_dd=0.02;g=-9.81;q1_d=0.001;X_d=0.02;Xo=0.65+0.1;Yo=0.1;
Fcg=[-mus*(Mo*g+Fn1);0];   
Fo=R_Object_Dynamics(Io,Mo,X_d,X_dd,Xo,Yo,g,q1,q1_d,q1_dd)-Fcg;
Fc=pinv(G)*[Fo(1);0;Fo(2)]+(eye(2)-pinv(G)*G)*[y1;y2];

AD=0.2;
AF=0.02;
FH=AF*sin(q1);
AI=AD*sin(pi/2-q1);
FG=FH+AI;
ID=AI/tan(pi/2-q1);
EI=AI/tan(q1);
OD=0.65;
OE=OD-(EI+ID);
AH=FH/tan(q1);
OI=EI+OE
x1=OI+AH;
EG=EI+AH;
y1=EG*tan(q1);
x3=OE;y3=0;
x2=OD;y2=0;
N=[-y1+y3;-x3+x1];
n=N/norm(N);
C2=(Fc-Fc'*n*n)'*(Fc-Fc'*n*n)
L=Fc'*Fc-L1*Fc'*n-L2*C2
