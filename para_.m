

function [t1,t1_d,t1_dd]=para_(t10,t10_d,t10_dd,t,ts,t1s)

a51= -(t10_dd*ts^2 + 6*t10_d*ts + 12*t10 - 12*t1s)/(2*ts^5);
a41= (3*t10_dd*ts^2 + 16*t10_d*ts + 30*t10 - 30*t1s)/(2*ts^4);
a31= -(3*t10_dd*ts^2 + 12*t10_d*ts + 20*t10 - 20*t1s)/(2*ts^3);
a21= t10_dd/2;
a11= t10_d;
a01= t10;

t1=a51*t^5+a41*t^4+a31*t^3+a21*t^2+a11*t+a01;
t1_d=5*a51*t^4 + 4*a41*t^3 + 3*a31*t^2 + 2*a21*t + a11;
t1_dd=20*a51*t^3 + 12*a41*t^2 + 6*a31*t + 2*a21;
