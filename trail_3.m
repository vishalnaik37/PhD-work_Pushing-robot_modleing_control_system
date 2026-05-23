q1=0.01;
q2=0.01;
q1dot=0.1;
q2dot=0.1;
aq1=0.01;
aq2=0;
Fd=0;


g=9.81;
a1=0.05;  
a2=0.05; 
L01=0.05;
m1=0.00156;
m2=0.00156;
m3=4.90088e-05;
a1_=0.0001;
b1_=0.0001;
phi1=-1.57;
% m3=0;
C1=a1/2;
C2=(m2*0.5*a2+m3*a2)/(m2+m3);

r=0.001;
I1=[0 0 0;0 m1*a1^2/12 0;0 0 m1*a1^2/12];
I2=[0 0 0;0 m2*a2^2/12 0;0 0 m2*a2^2/12];
I3=[0 0 0;0 m3*r^2/2 0;0 0 m3*r^2/2];

Itot1=I1; 
Itot2=I2+I3+[zeros(2,3);zeros(1,2) m3*(C2-a2)^2]; 
% if t<=40
Jac = R_Jac1(a1,a2,a1_,b1_,phi1,q1,q2);
Jd=R_Jd1(a1,a2,a1_,b1_,phi1,q1,q2,q1dot,q2dot);
Fd=[0.1];
aq11=aq1;
aq21=aq2;
% end
M=R_M(C1,C2,Itot1(9),Itot2(9),a1,m1,m2+m3,q2);
C =  R_damp(C2,a1,m2+m3,q2,q1dot,q2dot);
G= R_Gra(C1,C2,a1,m1,m2+m3,g,q1,q2);
M_=inv(Jac')*M*inv(Jac);
nt=inv(Jac')*(-M*inv(Jac)*Jd*[q1dot;q1dot]+(C+G));
A =  [0 1];
x1=1;

P=eye(2)-(A'*inv(A*inv(M_)*A')*A*inv(M_))*x1;
F1=P*(M_*[aq1;aq2]+nt);
F2=(eye(2)-P)*(M_*[aq11;aq21]+nt+A'*Fd);
F=F1+F2;
F11=[F1 F2 F]
u =Jac'*(P*(M_*[aq1;aq2]+nt)+(eye(2)-P)*(M_*[aq11;aq21]+nt+A'*Fd));
u1=u(1);
u2=u(2);
DD=inv(Jac)*([aq1;aq2]-Jd*[q1dot;q1dot])
U=M*DD+C+G+Jac'*A'*Fd;
% DD=inv(vpa(P*M_,3))*(inv(Jac')*u-nt-(eye(2)-P)*(M_*[aq11;aq21]));

DD=inv(M)*(u-C-G-Jac'*A'*Fd);
DD1=DD(1);
DD2=DD(2);