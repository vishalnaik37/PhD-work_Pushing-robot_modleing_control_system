% clear all
% clc
function R=Contact_Analysis(Yo, q1, Xc,X, mu)
AD=2*Yo;
FH=(Xc+0.1)*sin(q1);
AF=(Xc+0.1)*cos(q1);
AI=AD*sin(pi/2-q1);
FG=FH+AI;
ID=AI/tan(pi/2-q1);
if tan(q1)==0
    EI=X;
    AH=AF;

else
EI=AI/tan(q1);
AH=FH/tan(q1);
end
OE=X-(EI+ID);

OI=EI+OE;
x1=OI+AH;
EG=EI+AH;
if tan(q1)==0
    y1=2*Yo;
       y3=y1;
else
y1=EG*tan(q1);y3=0;
end
x3=OE;
% if tan(q1)==0
%     y3=y1;X3=0
% end
n=[y1-y3;-x1+x3];
hat_n=n/norm(n);
x2=X;
y2=0;
e12=-[x1-x2;y1-y2];
Eq=abs((acos(e12'*hat_n/norm(e12))))-atan(mu);
if Eq<0
  disp('Force_Closure')
  % R=1;
else
    disp('Not a Force_Closure')
    % R=0;
end
