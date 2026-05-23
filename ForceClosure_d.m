function EQ=ForceClosure_d(Yo, q1, Xc,X, mu,Xc_d,q1_d)
h=0.001;
P=ForceClosure(Yo, q1, Xc,X, mu);
PXc=ForceClosure(Yo, q1, Xc+h,X, mu);
Pq1=ForceClosure(Yo, q1+h, Xc,X, mu);
EQ=([PXc-P Pq1-P]*[Xc_d;q1_d]/h;