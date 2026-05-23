% 
P1=[  0.55+0.02+0.06
    0.2];
L1=0.5;
L2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2]';
P0=P1;
r=0.01;
for n=1:20
    t1=Z0(1);t2=Z0(2);
PP=R_EQ1(L01,L1,L2,r,t1,t2)-P0(1:2);
PPq1=R_EQ1(L01,L1,L2,r,t1+h,t2)-P0(1:2);
PPq2=R_EQ1(L01,L1,L2,r,t1,t2+h)-P0(1:2);
Jac=([PPq1 PPq2]-[PP PP])/h;
Z1=Z0-inv(Jac)*PP;
err=abs(Z1-Z0);
if err<=0.0001
    disp('completed');
    break
else Z0=Z1;
end
end

Xc0=-0.1;
th=-(t1+t2+pi)+pi/2;
t12=[cos(t1) -sin(t1)  0;sin(t1) cos(t1) L01  ; 0 0 1];
t23=[cos(t2) -sin(t2)  L1;sin(t2) cos(t2) 0  ; 0 0 1];
t34=[cos(th) -sin(th)  L2;sin(th) cos(th) 0  ; 0 0 1];
R=t12*t23*t34*[r;0;1];
P1=t12*[0;0;1];
P2=t12*t23*[0;0;1];
P3=t12*t23*t34*[0;0;1];


% P2=[0.65,0];
% q1=pi/3;
% ED=0.65-x2;
% CD=EP2*tan(q1);
% x3=0.65;y3=0;y2=0;
% n=[y1-y2,x2-x1];
% e12=-[0.65-x1;0-y1];
% Eq1=acos(e12'*n'/(norm(e12)*norm(n)))-atan(0.3)

q1=0;

Xc0=0.2/2;X=0.65;Xo=0.65+0.1;Yo=0.1;Yc1=0.1;th0=-pi/6;
% Pco = R_EQO(X,Xc0,Xo,Yc1,Yo,q1,r,q1,q2,th0)
% EqP = R_EQP(L01,L1,L2,X,Xc,Xo,Yo,q1,r,t1,t2)
