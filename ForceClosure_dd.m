function EQ=ForceClosure_dd(Yo, q1, Xc,X, mu,Xc_d,q1_d,Xc_dd,q1_dd)
h=0.001;
P=ForceClosure_d(Yo, q1, Xc,X, mu,Xc_d,q1_d);
PXc=ForceClosure_d(Yo, q1, Xc+h,X, mu,Xc_d,q1_d);
Pq1=ForceClosure_d(Yo, q1+h, Xc,X, mu,Xc_d,q1_d);
PXcd=ForceClosure_d(Yo, q1, Xc,X, mu,Xc_d+h,q1_d);
Pq1d=ForceClosure_d(Yo, q1, Xc,X, mu,Xc_d,q1_d+h);
EQ=[PXc-P Pq1--P PXcd-P Pq1d-P]*[X_d;q1_d;Xc_dd;q1_dd];