% 
P1=[  0.65
    0.22];

% % Yf=0.2;
% % Xf=0.5-0.1+0.25;
% % P=[Xf;Yf];
% Z0=[0.1,0.2]';
% h=0.0001;
% L01=0.5;
% L1=0.5;
% L2=L1;
% for jn=1:100
%     t1=Z0(1);
%     t2=Z0(2);
% E=R_EQ(L01,L1,L2,t1,t2)-P;
% Et1=R_EQ(L01,L1,L2,t1+h,t2)-P;
% Et2=R_EQ(L01,L1,L2,t1,t2+h)-P;
% J=([Et1 Et2]-[E E])/h;
% Z1=Z0-inv(J)*E;
% err=abs(Z1-Z0);
% if err<=0.0001
%     break;
% else
%     Z0=Z1;
% end
% end
% t1s=wrapToPi(t1);
% t2s=wrapToPi(t2);


a1=0.5;
a2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2]';
P0=P1;
th=-pi/3;r=0.01;
for n=1:20
    q1=Z0(1);q2=Z0(2);
PP=R_EQ1(L01,a1,a2,r,q1,q2)-P0(1:2);
PPq1=R_EQ1(L01,a1,a2,r,q1+h,q2)-P0(1:2);
PPq2=R_EQ1(L01,a1,a2,r,q1,q2+h)-P0(1:2);
Jac=([PPq1 PPq2]-[PP PP])/h;
Z1=Z0-inv(Jac)*PP;
err=abs(Z1-Z0);
if err<=0.0001
    disp('completed');
    break
else Z0=Z1;
end
end