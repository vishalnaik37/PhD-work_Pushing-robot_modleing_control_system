clear all
syms m1 X_dd b1 b2 b3 y1 y2  y3 y4 b4 Y_dd L1 L2 mu real
m1=0.5;
X_dd=0.01;
Y_dd=0.00;
mu=0.2;
B=[b1;b2;b3;b4]
G=[1 0;0 1;1 0;0 1];
E=m1*[X_dd;0]+G'*B
y1=-y3;% y is null space of G
y2=-y4;
y=[y1;y2;y3;y4]
Fc=pinv(G')*[m1*X_dd;m1*Y_dd]+(eye(4)-pinv(G')*G')*y;
% 
% L=Fc'*Fc+L1*(Fc(2)-0.001+Fc(1)/mu)+L2*(Fc(4)-0.001+Fc(3)/mu);
% EQ=jacobian(L,[L1,L2,y1,y2,y3,y4])';
% Jac=jacobian(EQ,[L1,L2,y1,y2,y3,y4]);
% 
% Z0=[1,2,3,4,5,6]';
% 
% for m=1:200
%     % L1_=Z0(1);
%     % L2_=Z0(2);
%     % y1_=Z0(3);
%     % y2_=Z0(4);
%     % y3_=Z0(5);
%     % y4_=Z0(6);
% E=subs(EQ,[L1,L2,y1,y2,y3,y4],Z0');
% Jac1=subs(Jac,[L1,L2,y1,y2,y3,y4],Z0');
% Z1=Z0-inv(Jac1)*E;
% err=abs(Z1-Z0);
% if err<=0.00001
%     disp('completed')
%     break
% else Z0=Z1;
% end
% end
N=[Fc(2)-0.001+Fc(1)/mu;Fc(4)-0.001+Fc(3)/mu];
