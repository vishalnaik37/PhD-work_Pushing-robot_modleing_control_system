
clear all
clc
 
Mo=1.8
Io=0.12;
X_dd=0.01;
Y_dd=0.001;
alpha2_dd=0.1;
g=-9.81;


To = R_Object_Dynamics(Io,Mo,X_dd,Y_dd,alpha2_dd,g);

mu=0.3
mus=0.1;
Ft=mus
