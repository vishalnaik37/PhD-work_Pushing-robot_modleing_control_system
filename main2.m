clear all      
clc
syms r h Ra Ds c3 alpha10 alpha11 phi10 phi11 alpha20 alpha21 dt s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 k11 k12 k13 k14 k15 t3d Kd1 Kd2 Kd3 A1 A2 A3 t1d_d t2d_d t3d_d t1d_dd t2d_dd t3d_dd PI Xfd Yfd Xf Yf L3 t3 t1_ddd t2_ddd Y_ddd gama_ddd Z_ddd X_ddd alpha1_ddd alpha2_ddd phi1_ddd  c1 c2 Mo Io X X_d X_dd Z_d Z_dd L01 L02 H t3 q3 X Z t3_d A9 A10 A11 q3_d t3_dd q3_dd L5 L6 L1 L2 L3 L4 M8 M9 I8 I9 M1 M2 M3 M4 M5 M6 M7 Ki N I1 I2 I3 I4 I5 I6 I7 Kp Kd g a1 a2 a b1 b2 b t1 t2 Y th q1 q2 phi1 phi2 alpha1 alpha2 t1_d t2_d Y_d th_d q1_d q2_d phi1_d phi2_d alpha1_d alpha2_d t1_dd t2_dd Y_dd th_dd q1_dd q2_dd phi1_dd phi2_dd alpha1_dd alpha2_dd  A1 A2 A3 A4 A5 A6 A7 A8 a1 b1 a b a2 b2 mt1 mt2 mt3 mt4 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 z11 z12 z13 z14 z15 z16 z17 z18 z19 z20 time TH TH_d TH_dd M1 M2 M3  M4 M5 I1 I2 I3 I4 I5 gama z21 z22 x21 x22 gama_d gama_dd B1 B2 B3 B4 B5 B6 B7 B8 C1 C2 C3 C4 C5 C6 C7 C8 X1 X2 X3 X4 X5 X6 X7 X8 X9 X10 X11 X12 X13 X14 X15 X16 X17 X18 X19 X20 X21 X22 u1 w1 h1 s1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20 u21 u22 w2 w3 w4 w5 w6 w7 w8 w9 w10 w11 w12 w13 w14 w15 w16 w17 w18 w19 w20 w21 w22 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 h15 h16 h17 h18 h19 h20 h21 h22 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s1_d s2_d s1 s2 s1_dd s2_dd ss1 ss2 t1d t2d Yd q1d q2d gamad thd alpha1d alpha2d phi1d phi2d t1d_d t2d_d Yd_d q1d_d q2d_d gamad_d thd_d alpha1d_d alpha2d_d phi1d_d phi2d_d t1d_dd t2d_dd q1d_dd q2d_dd Yd_dd gamad_dd thd_dd Kp1 Kp2 Kp3 Kp4 Kd1 Kd2 Kd3 Kd4 Ki1 Ki2 Ki3 Ki4 A1d A2d A3d A4d real 

% ds1=sqrt((a1*sin(phi1))^2+(b1*cos(phi1))^2);
% ds1_=sqrt((a*sin(alpha1))^2+(b*cos(alpha1))^2);
% ds2=X;
% ds2_=sqrt((a*sin(alpha2))^2+(b*cos(alpha2))^2);
% E1=int(ds1,phi1)+int(ds1_,alpha1);
% E2=X+int(ds2_,alpha2);

psi1=atan2(a1*sin(phi1),(b1*cos(phi1)));
th1=atan2(a*sin(alpha1),(b*cos(alpha1)));
l1=a1*cos(phi1)*sin(psi1)-b1*sin(phi1)*cos(psi1);
l1 = rewrite(l1,'sqrt');
l2=a1*cos(phi1)*cos(psi1)+b1*sin(phi1)*sin(psi1); 
l2 = rewrite(l2,'sqrt');
l1_=a*cos(alpha1)*sin(th1)-b*sin(alpha1)*cos(th1);
l1_ = rewrite(l1_,'sqrt');
l2_=a*cos(alpha1)*cos(th1)+b*sin(alpha1)*sin(th1);
l2_ = rewrite(l2_,'sqrt');

E3=(t1+t2+psi1+pi)-pi/2;
th=-(t1+t2+pi)+pi/2;
% matlabFunction(E3,'file','E3','Optimize',false);

t12=[cos(t1) -sin(t1)  0;sin(t1) cos(t1) L01  ; 0 0 1];
t23=[cos(t2) -sin(t2)  L1;sin(t2) cos(t2) 0  ; 0 0 1];
t34=[cos(th) -sin(th)  L2 ;sin(th) cos(th) 0  ; 0 0 1];
R=t12*t23*t34*[r;0;1];

pos=R(1:2);
EQ=pos;  % to find t1,t2,t3 for given R11
matlabFunction(EQ,'file','R_EQ1','Optimize',false);
% Pf=t12*t23*[L2;0;1];
% Jac=jacobian(Pf(1:2),[t1,t2]);
% Jac1=jacobian(pos,[t1,t2]);
% Jac_d=diff(Jac,t1)*t1_d+diff(Jac,t2)*t2_d;
% Jac_d1=diff(Jac1,t1)*t1_d+diff(Jac1,t2)*t2_d;
% A=jacobian(Pf(2),[t1,t2]);
% matlabFunction(A,'file','R_A','Optimize',false);
% matlabFunction(Jac_d,'file','R_Jd','Optimize',false);
% matlabFunction(Jac,'file','R_Jac','Optimize',false);
% matlabFunction(Jac1,'file','R_Jac1','Optimize',false);
% matlabFunction(Jac_d1,'file','R_Jd1','Optimize',false);
% 
% % C1=L1/2;
% % C2=(M2*L2/2+M3*L2)/(M2+M3);
% 
% P1=t12*[C1;0;1];
% P2=t12*t23*[C2;0;1];
% Vc1=jacobian(P1,[t1,t2])*[t1_d;t2_d];
% Vc2=jacobian(P2,[t1,t2])*[t1_d;t2_d];
% Gr=[0,g,0];
% KE=0.5*simplify(M1*Vc1'*Vc1+I1*t1_d^2+M2*Vc2'*Vc2+I2*(t1_d+t2_d)^2);
% PE=M1*Gr*P1+M2*Gr*P2;
% L=KE-PE;
% KEd=jacobian(KE,[t1_d,t2_d])';
% Mass=jacobian(KEd,[t1_d,t2_d])
% Damp=jacobian(KEd,[t1,t2])*[t1_d;t2_d]-jacobian(KE,[t1,t2])';
% Gra=jacobian(PE,[t1,t2])'
% matlabFunction(Mass,'file','R_M','Optimize',false);
% matlabFunction(Damp,'file','R_damp','Optimize',false);
% matlabFunction(Gra,'file','R_Gra','Optimize',false);
% T=Mass*[t1_dd;t2_dd]+Damp+Gra;
% syms T1 T2 real
% 
% TDD=-inv(Mass)*(Damp+Gra-[T1;T2]);
% matlabFunction(TDD(1),'file','R_EQ_','Optimize',false);
% matlabFunction(TDD(2),'file','R_EQ2','Optimize',false);
% 
% 
% 
% d1_=[t1,t2];
% d2_=[t1_d,t2_d];
% M=Mass
% for i=1:2
% for j=1:2
% for k=1:2
% N(k)=jacobian(M(i,j),d1_(k))*d2_(k)+jacobian(M(i,k),d1_(j))*d2_(k)-jacobian(M(j,k),d1_(i))*d2_(k);
% end
% L(i,j)=sum(N);
% end
% end
% Mf=M(1:2,1:2);
% Cf=0.5*L(1:2,1:2)
% % *d2_(1:2)';