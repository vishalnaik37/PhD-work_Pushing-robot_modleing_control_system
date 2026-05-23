clear all
syms a b c x y z Vx Vy Vz a1 a2 a3 b1 b2 b3 c1 c2 c3 real
S=[ 0 -a -b;a 0 -c;b c 0];
P=[a1 a2 a3;b1 b2 b3;c1 c2 c3];
EQ=P*P-P
PS=P*S;
V=[Vx;Vy;Vz]
VPSV=simplify(V'*PS*V);
PE=solve(EQ,[a1 a2 a3 b1 b2 b3 c1 c2 c3]);

for n=1:25
    a1=PE.a1(n);
    b1=PE.b1(n);
    c1=PE.c1(n);
    a2=PE.a2(n);
    b2=PE.b2(n);
    c2=PE.c2(n);
    a3=PE.a3(n);
    b3=PE.b3(n);
    c3=PE.c3(n);
P=[a1 a2 a3;b1 b2 b3;c1 c2 c3];
PS=P*S;
VPSV(n)=simplify(V'*PS*V);

end