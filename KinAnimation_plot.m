clear all
clc
L1=0.5;
L2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2,-0.1]';
Xo=0.1;Yo=0.1;r=0.01;
X10=0.55;X10_d=0;X10_dd=0;
q10=0*pi/180;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Ts=25;
Xc0=0;
q1s=4.4300*pi/180;
X1s=X10+0.07;
Y=0;
[P11_,P21_,P31_,P41_,Q11_,Q12_,Q13_,Q14_,T_,XC]=KinAnimation(X10,q10,q1s,X1s,Ts,Y);

X10=X1s;X10_d=0;X10_dd=0;
q10=4.4300*pi/180;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
q1s=12*pi/180;
X1s=X1s+0.07;
[P11__,P21__,P31__,P41__,Q11__,Q12__,Q13__,Q14__,T__,XC]=KinAnimation(X10,q10,q1s,X1s,Ts,Y);
P111=[P11_,P11__];P211=[P21_,P21__];P311=[P31_,P31__,XC];P411=[P41_,P41__];Q111=[Q11_,Q11__];Q121=[Q12_,Q12__];Q131=[Q13_,Q13__];Q141=[Q14_,Q14__];T1=[T_,T__];
for n=1:1:26
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
t3=0;
a11=r;b11=r;
k1=double(a11*cos(f)*cos(t1+t2)-b11*sin(f)*sin(t1+t2)+P31(1));
k2=double(a11*cos(f)*sin(t1+t2)+b11*sin(f)*cos(t1+t2)+P31(2));
Ellipse1=plot(k1,k2,'color','k','LineWidth',2);
rectangle('Position',[0.82 0 0.02 0.02])
axis([-0.5 1 -0.5 1]);
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
% [P11_,P21_,P31_,P41_,Q11_,Q12_,Q13_,Q14_,T_]=KinAnimation(X10,q10,q1s,X1s,Ts);

% 
% X10=X10+0.2;X10_d=0;X10_dd=0;
% q10=q1s;q10_d=0;q10_dd=0;
% k=0; 
% mu=0.3;
% Ts=25;
% Xc0=0;
% q1s=12*pi/180;
% X1s=X10+0.07;

