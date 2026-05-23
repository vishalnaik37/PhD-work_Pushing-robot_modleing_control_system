clear all
clc
L1=0.5;
L2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2,-0.1]';
Xo=0.1;Yo=0.1;r=0.01;

X10=0.55+0.02;X10_d=0;X10_dd=0;
q10=0*pi/180;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Ts=25;
Xc0=0;
q1s=0;
X1s=0.79-sqrt(0.2^2-0.02^2);
Y10=0;Y1s=0;
[P11_,P21_,P31_,P41_,Q11_,Q12_,Q13_,Q14_,T_,XC]=KinAnimation(X10,q10,q1s,X1s,Ts,Y10,Y1s);

X10=X1s;X10_d=0;X10_dd=0;
q10=0;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
q1s=asin(0.02/0.2);
X1s=0.79-sqrt(0.2^2-0.02^2);
[P11__,P21__,P31__,P41__,Q11__,Q12__,Q13__,Q14__,T__,XC__]=KinAnimation(X10,q10,q1s,X1s,Ts,Y10,Y1s);

X10=X1s;X10_d=0;X10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
X10s=0.79-sqrt(0.2^2-0.02^2)+0.01+0.15;
x4=0.8;y4=0.02;
q10=q1s;
Xc=0.04;
q1s=asin(0.02/0.04);
[P11_1,P21_1,P31_1,P41_1,Q11_1,Q12_1,Q13_1,Q14_1,T_1,Q]=KinAnimation3(X10,X1s,Ts,Y10,Y1s,x4,y4);
% [P11_1,P21_1,P31_1,P41_1,Q11_1,Q12_1,Q13_1,Q14_1,T_1,Q]=KinAnimation5(X10,q10,q1s,X1s,Ts,Y10,Y1s,Xc)

X10=X1s;X10_d=0;X10_dd=0;
q10=Q(end);q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
q1s=0;
X1s=0.8;
Y10=0;Y1s=0.02;
% [P11_2,P21_2,P31_2,P41_2,Q11_2,Q12_2,Q13_2,Q14_2,T_2,XC_2]=KinAnimation(X10,q10,q1s,X1s,Ts,Y10,Y1s);
[P11_2,P21_2,P31_2,P41_2,Q11_2,Q12_2,Q13_2,Q14_2,T_2,Q]=KinAnimation3(X10,X1s,Ts,Y10,Y1s,x4,y4);
% [P11_2,P21_2,P31_2,P41_2,Q11_2,Q12_2,Q13_2,Q14_2,T_2,XC_2]=KinAnimation5(X10,q10,q1s,X1s,Ts,Y10,Y1s,Xc);

X10=X1s;X10_d=0;X10_dd=0;
q10=Q(end);q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
q1s=0;
X1s=X10;
Y10=0.02;Y1s=0.02;
[P11_3,P21_3,P31_3,P41_3,Q11_3,Q12_3,Q13_3,Q14_3,T_3,XC_3]=KinAnimation(X10,q10,q1s,X1s,Ts,Y10,Y1s);

X10=X1s;X10_d=0;X10_dd=0;
q10=q1s;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
q1s=-asin(0.02/0.18);
X1s=X10+0.02-0.02*cos(q1s);Y10=0.02;Y1s=0.02-0.02*sin(q1s);
% [P11,P21,P31,P41,Q11,Q12,Q13,Q14,T,Q]=KinAnimation3(X10,X1s,Ts,Y10,Y1s)
x4=1;y4=0.02;Xc=-0.04;
% [P11_3,P21_3,P31_3,P41_3,Q11_3,Q12_3,Q13_3,Q14_3,T_3,XC_3]=KinAnimation3(X10,X1s,Ts,Y10,Y1s,x4,y4);
% [P11_3,P21_3,P31_3,P41_3,Q11_3,Q12_3,Q13_3,Q14_3,T_3,XC_3]=KinAnimation(X10,q10,q1s,X1s,Ts,Y10,Y1s);
[P11_4,P21_4,P31_4,P41_4,Q11_4,Q12_4,Q13_4,Q14_4,T_4,XC_4]=KinAnimation5(X10,q10,q1s,X1s,Ts,Y10,Y1s,Xc);
P111=[P11_,P11__,P11_1,P11_2,P11_3,P11_4];P211=[P21_,P21__,P21_1,P21_2,P21_3,P21_4];P311=[P31_,P31__,P31_1,P31_2,P31_3,P31_4];P411=[P41_,P41__,P41_1,P41_2,P41_3,P41_4];Q111=[Q11_,Q11__,Q11_1,Q11_2,Q11_3,Q11_4];Q121=[Q12_,Q12__,Q12_1,Q12_2,Q12_3,Q12_4];Q131=[Q13_,Q13__,Q13_1,Q13_2,Q13_3,Q13_4];Q141=[Q14_,Q14__,Q14_1,Q14_2,Q14_3,Q14_4];T1=[T_,T__,T_1,T_2,T_3,T_4];
for n=1:1:Ts*6
    P11=P111(:,n);P21=P211(:,n);P31=P311(:,n);P41=P411(:,n);Q11=Q111(:,n);Q12=Q121(:,n);Q13=Q131(:,n);Q14=Q141(:,n);T=T1(:,n);t1=T(1);t2=T(2);
hold on;
L11=line([P11(1) P21(1)],[P11(2) P21(2)]);
L21=line([P21(1) P31(1)],[P21(2) P31(2)]);
L31=line([P31(1) P41(1)],[P31(2) P41(2)]);
L41=line([Q11(1) Q12(1)],[Q11(2) Q12(2)]);
L51=line([Q12(1) Q13(1)],[Q12(2) Q13(2)]);
L61=line([Q13(1) Q14(1)],[Q13(2) Q14(2)]);
L71=line([Q14(1) Q11(1)],[Q14(2) Q11(2)]);
f=0:0.1:6.4;
a11=r;b11=r;
k1=double(a11*cos(f)*cos(t1+t2)-b11*sin(f)*sin(t1+t2)+P31(1));
k2=double(a11*cos(f)*sin(t1+t2)+b11*sin(f)*cos(t1+t2)+P31(2));
Ellipse1=plot(k1,k2,'color','k','LineWidth',2);
rectangle('Position',[0.8 0 0.02 0.02])
axis([0 1 0 1]);
axis equal;
grid on;
pause(0.1);
delete(L11);
delete(L21);
delete(L31);
delete(L41);
delete(L51);
delete(L61);
delete(L71);
delete(Ellipse1);
hold off;  
end
hold on;
L11=line([P11(1) P21(1)],[P11(2) P21(2)]);
L21=line([P21(1) P31(1)],[P21(2) P31(2)]);
L31=line([P31(1) P41(1)],[P31(2) P41(2)]);
L41=line([Q11(1) Q12(1)],[Q11(2) Q12(2)]);
L51=line([Q12(1) Q13(1)],[Q12(2) Q13(2)]);
L61=line([Q13(1) Q14(1)],[Q13(2) Q14(2)]);
L71=line([Q14(1) Q11(1)],[Q14(2) Q11(2)]);
f=0:0.1:6.4;
a11=r;b11=r;
k1=double(a11*cos(f)*cos(t1+t2)-b11*sin(f)*sin(t1+t2)+P31(1));
k2=double(a11*cos(f)*sin(t1+t2)+b11*sin(f)*cos(t1+t2)+P31(2));
Ellipse1=plot(k1,k2,'color','k','LineWidth',2);
rectangle('Position',[0.8 0 0.02 0.02])
axis([-0.5 1 -0.5 1]);
axis equal;
grid on;
hold off;  

