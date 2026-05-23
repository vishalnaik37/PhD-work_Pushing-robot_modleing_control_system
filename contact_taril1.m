clear all
clc
syms Yo Xo q1 Xc Xc_d q1_d Xc_dd q1_dd X x1 y1 mu real
OD=X;
AF=Xc;
alpha=q1;
AD=2*Yo;
FH=AF*sin(alpha);
AI=AD*sin(pi/2-alpha);
FG=FH+AI;
ID=AI/tan(pi/2-alpha);
if tan(alpha)==0
    EI=X;
    AH=FH;
else
EI=AI/tan(alpha);
AH=FH/tan(alpha);
end
OE=OD-(EI+ID);

OI=EI+OE;
x1=OI+AH;
EG=EI+AH;
if tan(alpha)==0
    y1=2*Yo;
else
y1=EG*tan(alpha);
end
x3=OE;
y3=0;
n=[y1-y3;-x1+x3];
hat_n=n/norm(n);
x2=OD;
y2=0;
e12=-[x1-x2;y1-y2];
EQ=abs((acos(e12'*n/norm(e12)))-pi)-atan(mu);
EQd=jacobian(EQ,[Xc,q1])*[Xc_d;q1_d];
EQdd=jacobian(EQd,[Xc,q1,Xc_d,q1_d])*[Xc_d;q1_d;Xc_dd;q1_dd];

matlabFunction(EQ,'File','R_FC','Optimize',false)
matlabFunction(EQd,'File','R_FCd','Optimize',false)
matlabFunction(EQdd,'File','R_FCdd','Optimize',false)


 % EQ = R_FC(Xc,Yo,mu,q1)
