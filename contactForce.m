

syms mus Fx Fy Fn1 y1 y2 y3 real
y=-(Y*cos(alpha2) + Xc*sin(alpha2));
x=Xc*cos(alpha2) - Y*sin(alpha2);
Gc1=[1 0 y;0 1 x];
Fcg=[-mus*(Mo*g+Fn1);0;0]
Fc=[Fx;Fy];
To=R_Object_Dynamics(Io,Mo,X_dd,Y_dd,alpha2_dd,g)-Fcg;
Fc=pinv(Gc1')*To+(eye(2)-pinv(Gc1')*Gc1')*[y1;y2]
gd1=[0;1]
C1=Fc'*Fc