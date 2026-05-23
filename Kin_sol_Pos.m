 % 
clear all

X10=0;X10_d=0;X10_dd=0;
Y10=0;Y10_d=0;Y10_dd=0;
Z10=0;Z10_d=0;Z10_dd=0;
p=0;
for t=0:0.1:10
    p=p+1;
    ts=10;
    X10=0.65;Y10=0.3;Z10=1;
    X1s=0.65;Y1s=0.2;Z1s=0.1;
[X11,X11_d,X11_dd]=para_(X10,X10_d,X10_dd,t,ts,X1s);
[Y11,Y11_d,Y11_dd]=para_(Y10,Y10_d,Y10_dd,t,ts,Y1s);
[Z11,Z11_d,Z11_dd]=para_(Z10,Z10_d,Z10_dd,t,ts,Z1s);

X110(:,p)=X11;
Y110(:,p)=Y11;
Z110(:,p)=Z11;
X11d0(:,p)=X11_d;
Y11d0(:,p)=Y11_d;
Z11d0(:,p)=Z11_d;
X11dd0(:,p)=X11_dd;
Y11dd0(:,p)=Y11_dd;
Z11dd0(:,p)=Z11_dd;
T110(p)=t;
F01(p)=0;
end
% Fd_=F_;
P0=[X110;Y110];
P0d=[X11d0;Y11d0];
P0_dd=[X11dd0;Y11dd0];
for p=1:101
a1=0.5;
a2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2]';
for n=1:20
    q1=Z0(1);q2=Z0(2);
PP=R_EQ(L01,a1,a2,q1,q2)-P0(:,p);
PPq1=R_EQ(L01,a1,a2,q1+h,q2)-P0(:,p);
PPq2=R_EQ(L01,a1,a2,q1,q2+h)-P0(:,p);
Jac=([PPq1 PPq2]-[PP PP])/h;
Z1=Z0-inv(Jac)*PP;
err=abs(Z1-Z0);
if err<=0.0001
    disp('completed');
    break
else Z0=Z1;
end
end
Ang(:,p)=[q1;q2];
% Jac = R_Jac(L1,L2,t1,t2);
% Jd=R_Jd(L1,L2,t1,t2,t1_d,t2_d)
% PP(:,p)=Jac*Z0;
% PPP(:,p)=Jac*Z0+Jd;

end
 Kp1=1000;Kp2=1000;




 