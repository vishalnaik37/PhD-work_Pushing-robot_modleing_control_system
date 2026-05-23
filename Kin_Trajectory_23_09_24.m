clear all
clc
L1=0.5;
L2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2,-0.1]';
Xo=0.1;Yo=0.1;r=0.01;

%% 1
X10=0.55+0.02;X10_d=0;X10_dd=0;
q10=0*pi/180;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Ts=25;
Xc0=0;
q1s=0;
X1s=0.79-sqrt(0.2^2-0.02^2);
Y10=0;Y1s=0;
[P11_1,P21_1,P31_1,P41_1,Q11_1,Q12_1,Q13_1,Q14_1,T_1,XC_1,VPP_1,APP_1,PP_1,Time_1]=KinAnimation(X10,q10,q1s,X1s,Ts,Y10,Y1s);


%% 2
% Xc=XC(end);
X10=X1s;X10_d=0;X10_dd=0;
q10=0;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
q1s=asin(0.02/0.2);
X1s=0.79-sqrt(0.2^2-0.02^2);
[P11_2,P21_2,P31_2,P41_2,Q11_2,Q12_2,Q13_2,Q14_2,T_2,XC_2,VPP_2,APP_2,PP_2,Time_2]=KinAnimation(X10,q10,q1s,X1s,Ts,Y10,Y1s);

%% 3
X10=X1s;X10_d=0;X10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
X1s=0.79-sqrt(0.2^2-0.02^2)+0.01+0.15;
x4=0.8;y4=0.02;
q10=q1s;
q1s=asin(0.02/0.04);
q1s=0.8;
[P11_3,P21_3,P31_3,P41_3,Q11_3,Q12_3,Q13_3,Q14_3,T_3,Q,VPP_3,APP_3,PP_3,Time_3]=KinAnimation3(X10,X1s,Ts,Y10,Y1s,x4,y4)
% [P11_3,P21_3,P31_3,P41_3,Q11_3,Q12_3,Q13_3,Q14_3,T_3,Q]=KinAnimation5(X10,q10,q1s,X1s,Ts,Y10,Y1s,Xc)

%% 4
X10=X1s;X10_d=0;X10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
X1s=0.8;
Y10=0;Y1s=0.02;
[P11_4,P21_4,P31_4,P41_4,Q11_4,Q12_4,Q13_4,Q14_4,T_4,Q1,VPP_4,APP_4,PP_4,Time_4]=KinAnimation3(X10,X1s,Ts,Y10,Y1s,x4,y4);

%% 5
Z0=[0.1,0.2]'*0.00001;
X10=0.8;X10_d=0;X10_dd=0;
q10=Q(end);q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
q1s=0;
X1s=0.8;
Y10=0.02;Y1s=0.02;
Xc=-0.04;
[P11_5,P21_5,P31_5,P41_5,Q11_5,Q12_5,Q13_5,Q14_5,T_5,XC_5,VPP_5,APP_5,PP_5,Time_5]=KinAnimation5(X10,q10,q1s,X1s,Ts,Y10,Y1s,Xc,Z0);

%% 6
Z0=T_5(:,end);
X10=X1s;X10_d=0;X10_dd=0;
q10=q1s;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
q1s=-asin(0.02/0.18);
X1s=X10+0.02-0.02*cos(q1s);Y10=0.02;Y1s=0.02-0.02*sin(q1s);
x4=1;y4=0.02;Xc=-0.04;
[P11_6,P21_6,P31_6,P41_6,Q11_6,Q12_6,Q13_6,Q14_6,T_6,XC_6,VPP_6,APP_6,PP_6,Time_6]=KinAnimation5(X10,q10,q1s,X1s,Ts,Y10,Y1s,Xc,Z0);

%% 7
Z0=T_6(:,end);
X10=X1s;X10_d=0;X10_dd=0;
q10=q1s;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
q1s=-asin(0.02/0.18);
X1s=X10+0.02;Y10=Y1s;Y1s=0.02;
x4=1;y4=0.02;Xc=-0.04;
[P11_7,P21_7,P31_7,P41_7,Q11_7,Q12_7,Q13_7,Q14_7,T_7,XC_7,VPP_7,APP_7,PP_7,Time_7]=KinAnimation5(X10,q10,q1s,X1s,Ts,Y10,Y1s,Xc,Z0);

%% 8
Z0=T_7(:,end);
X10=X1s;X10_d=0;X10_dd=0;
q10=q1s;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Xc0=0;
q1s=0;
X1s=X10+0.001;Y10=Y1s;Y1s=0;
x4=1;y4=0.02;Xc=-0.04;
[P11_8,P21_8,P31_8,P41_8,Q11_8,Q12_8,Q13_8,Q14_8,T_8,XC_8,VPP_8,APP_8,PP_8,Time_8]=KinAnimation5(X10,q10,q1s,X1s,Ts,Y10,Y1s,Xc,Z0);

%% 9
Z0=T_8(:,end);
X10=X1s;X10_d=0;X10_dd=0;
q10=0;q10_d=0;q10_dd=0;
k=0; 
mu=0.3;
Ts=25;
Xc0=0;
q1s=0;
X1s=X10+0.01;
Y10=0;Y1s=0;
[P11_9,P21_9,P31_9,P41_9,Q11_9,Q12_9,Q13_9,Q14_9,T_9,XC_9,VPP_9,APP_9,PP_9,Time_9]=KinAnimation5(X10,q10,q1s,X1s,Ts,Y10,Y1s,Xc,Z0);
P111=[P11_1,P11_2,P11_3,P11_4,P11_5,P11_6,P11_7,P11_8,P11_9];P211=[P21_1,P21_2,P21_3,P21_4,P21_5,P21_6,P21_7,P21_8,P21_9];P311=[P31_1,P31_2,P31_3,P31_4,P31_5,P31_6,P31_7,P31_8,P31_9];P411=[P41_1,P41_2,P41_3,P41_4,P41_5,P41_6,P41_7,P41_8,P41_9];Q111=[Q11_1,Q11_2,Q11_3,Q11_4,Q11_5,Q11_6,Q11_7,Q11_8,Q11_9];Q121=[Q12_1,Q12_2,Q12_3,Q12_4,Q12_5,Q12_6,Q12_7,Q12_8,Q12_9];Q131=[Q13_1,Q13_2,Q13_3,Q13_4,Q13_5,Q13_6,Q13_7,Q13_8,Q13_9];Q141=[Q14_1,Q14_2,Q14_3,Q14_4,Q14_5,Q14_6,Q14_7,Q14_8,Q14_9];T1=[T_1,T_2,T_3,T_4,T_5,T_6,T_7,T_8,T_9];
VPP=[VPP_1,VPP_2,VPP_3,VPP_4,VPP_5,VPP_6,VPP_7,VPP_8,VPP_9];
APP=[APP_1,APP_2,APP_3,APP_4,APP_5,APP_6,APP_7,APP_8,APP_9];
PP=[PP_1,PP_2,PP_3,PP_4,PP_5,PP_6,PP_7,PP_8,PP_9];
Time=[Time_1,Time_2+25+1,Time_3+2+2*25,Time_4+3+3*25,Time_5+4+4*25,Time_6+5+5*25,Time_7+6+6*25,Time_8+7+7*25,Time_9+8+8*25];
Kp1=5000;Kp2=10000;Kp3=150000;
Kfp=0.01;Kfi=8;