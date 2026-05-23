clear all
X10=0;X10_d=0;X10_dd=0;
Y10=0;Y10_d=0;Y10_dd=0;
Z10=0;Z10_d=0;Z10_dd=0;
p=0;
    ts=0.5;
    Ts0=ts;
for t=0:0.1:ts
    p=p+1;
    X10=0.65;Y10=0.22;Z10=1;
    X1s=0.65;Y1s=0.2;Z1s=0.1;
[X11,X11_d,X11_dd]=para_(X10,X10_d,X10_dd,t,ts,X1s);
[Y11,Y11_d,Y11_dd]=para_(Y10,Y10_d,Y10_dd,t,ts,Y1s);
[Z11,Z11_d,Z11_dd]=para_(Z10,Z10_d,Z10_dd,t,ts,Z1s);
X110(:,p)=X11;
Y110(:,p)=Y11;
Z110(:,p)=Z11;
X11d0(:,p)=X11_d;
Y11d0(:,p)=Y11_d;
Z11d0(:,p)=Z11_d;
X11dd0(:,p)=X11_dd;
Y11dd0(:,p)=Y11_dd;
Z11dd0(:,p)=Z11_dd;
T110(p)=t;
F01(p)=0;
end
% Fd_=F_;
% P0=[X110;Y110];
% P0d=[X11d0;Y11d0];
% P0_dd=[X11dd0;Y11dd0];
Kp1=1000;Kp2=1000;
% Fd_=F_;
P011=[X110;Y110;F01];
Ts=0.001;
K=load('W_Point');
T1=K.out.WP11.time+40+Ts+Ts0;
X1=K.out.WP11.signals(1).values;
Y1=K.out.WP11.signals(2).values;
F1=K.out.WP11.signals(3).values;
Xd1=K.out.WP21.signals(1).values;
Yd1=K.out.WP21.signals(2).values;
Fd1=K.out.WP21.signals(3).values;
Xdd1=K.out.WP31.signals(1).values;
Ydd1=K.out.WP31.signals(2).values;
Fdd1=K.out.WP31.signals(3).values;
T0=K.out.WP10.time+Ts0+0.1;
X0=K.out.WP10.signals(1).values;
Y0=K.out.WP10.signals(2).values;
F0=K.out.WP10.signals(3).values;
Xd0=K.out.WP20.signals(1).values;
Yd0=K.out.WP20.signals(2).values;
Fd0=K.out.WP20.signals(3).values;
Xdd0=K.out.WP30.signals(1).values;
Ydd0=K.out.WP30.signals(2).values;
Fdd0=K.out.WP30.signals(3).values;
T2=K.out.WP12.time+80+2*Ts+Ts0;
X2=K.out.WP12.signals(1).values;
Y2=K.out.WP12.signals(2).values;
F2=K.out.WP12.signals(3).values;
Xd2=K.out.WP22.signals(1).values;
Yd2=K.out.WP22.signals(2).values;
Fd2=K.out.WP22.signals(3).values;
Xdd2=K.out.WP32.signals(1).values;
Ydd2=K.out.WP32.signals(2).values;
Fdd2=K.out.WP32.signals(3).values;
% T=[T110,T0'];
% X=[X110,X2'];
% Y=[Y110,Y2'];
% F_=[F01,F1']
% P=[X;Y;F_];
% Xd=[X11d0,Xd2'];
% Yd=[Y11d0,Yd2'];
% Fd_=F_;
% Pd=[Xd;Yd;Fd_];
% Xdd=[X11dd0,Xdd2'];
% Ydd=[Y11dd0,Ydd2'];
T=[T0'];
X=[X2'];
Y=[Y2'];
F_=[F1']
P=[X;Y;F_];
Xd=[Xd2'];
Yd=[Yd2'];
Fd_=F_;
Pd=[Xd;Yd;Fd_];
Xdd=[Xdd2'];
Ydd=[Ydd2'];
Fdd_=F_;
Pdd=[Xdd;Ydd;Fdd_];
[r1,c]=size(P)
for p=1:c
a1=0.5;
a2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2]';
P0=P(:,p);r=0.01;
for n=1:20
    q1=Z0(1);q2=Z0(2);
PP=R_EQ(L01,a1,a2,0,r,q1,q2)-P0(1:2);
PPq1=R_EQ(L01,a1,a2,0,r,q1+h,q2)-P0(1:2);
PPq2=R_EQ(L01,a1,a2,0,r,q1,q2+h)-P0(1:2);
Jac=([PPq1 PPq2]-[PP PP])/h;
Z1=Z0-inv(Jac)*PP;
err=abs(Z1-Z0);
if err<=0.0001
    disp('completed');
    break
else Z0=Z1;
end
end
Ang(:,p)=wrapToPi([q1;q2]);
end
 Kp1=5000;Kp2=10000;
 % An=wrapToPi(Ang(1:2,102:40001));
 % Kd=0;
[r1,c]=size(P011)
for p=1:c
a1=0.5;
a2=0.5;
L01=0.5;
h=0.0001;
Z0=[0.1,0.2]';
P01=P(:,p);r=0.01;
for n=1:20
    q1=Z0(1);q2=Z0(2);
PP=R_EQ(L01,a1,a2,0,r,q1,q2)-P01(1:2);
PPq1=R_EQ(L01,a1,a2,0,r,q1+h,q2)-P01(1:2);
PPq2=R_EQ(L01,a1,a2,0,r,q1,q2+h)-P01(1:2);
Jac=([PPq1 PPq2]-[PP PP])/h;
Z1=Z0-inv(Jac)*PP;
err=abs(Z1-Z0);
if err<=0.0001
    disp('completed');
    break
else Z0=Z1;
end
end
Ang1(:,p)=wrapToPi([q1;q2]);
end
P0d=[X11d0;Y11d0;F01];
P0dd=[X11dd0;Y11dd0;F01];
m1=0;m2=0;d1=0;d2=0;k1=20;k2=4;
Kp=10;
Kd1=2*sqrt(Kp1);Kd2=2*sqrt(Kp2);Kd=2*sqrt(Kp);
Kd = 2.8284;
Kd1 = 141.42;
Kd2 = 200;
Kp = 2;
Kp1 = 5000;
Kp2 = 10000;
m1=0.6562;m2=0.1355;m3=0.1336;Kp1=10000;
Kp2=10000;Kd1=10000;Kd2=110;
Kd=2.8284;Kd1=141.42;Kd2=200;Kp=2;Kp1=5000;Kp2=10000;Kd2=110;
E=[1.1,1.2,1.3];
% % E1=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,18,19,20,-17,-18,-19,-20]*0.025/20;
% E=[1,2,3,4,5,6,7,8,9,10,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,]*5;
ANG=Ang(:,1);t10=ANG(1);t20=ANG(2)
% Mass=[1.56,1.56,0.0490088,0.5,0.5,0.032552,0.0306397,1.8,0.2;
%     10,10,12,1,1,11,1,2,3];
Mass=[1.56,1.56,0.0490088,0.5,0.5,0.032552,0.030397,0.03,0.03,0.03,1.8,0.2;
   1.56*2,1.56*2,0.0490088*2,0.5*2,0.5*2,0.032552*2,0.030397*2,0.03*2,0.03*2,0.03*2,1.8*2,0.2*2;
   1.56*3,1.56*3,0.0490088*3,0.5*3,0.5*3,0.032552*3,0.030397*3,0.03*3,0.03*3,0.03*3,1.8*3,0.2*3;
   1.56*4,1.56*4,0.0490088*4,0.5*4,0.5*4,0.032552*4,0.030397*4,0.03*4,0.03*4,0.03*4,1.8*4,0.2*4]
Tend=13.5;
for i=1:4
    ME=Mass(i,:)
TS=T(end);  % time to run the code
% Ds=10; % Transport Delay
% ME=E(i);  % in percentage
% dis=E(i); % Disturbance
sim('Final_Reciprocating_Simscape_19_08_24_ArbitaryMass');
% sim('Final_Computed_FFB_Contact');
Pxd=ans.ScopeData1.signals(1).values;
Pyd=ans.ScopeData1.signals(2).values;
Pxa=ans.ScopeData1.signals(3).values;
Pya=ans.ScopeData1.signals(4).values;
Time=ans.ScopeData1.time;
Fa=ans.ScopeData2.signals(1).values;
Fd=ans.ScopeData2.signals(2).values;
TimeF=ans.ScopeData2.time;
figure;
Exd=ans.ScopeData3.signals(1).values;
% Eyd=ans.ScopeData3.signals(2).values;
TimeV=ans.ScopeData3.time;
[r1,c]=size(Time);
Me=Exd;
EF=ans.ScopeData4.signals(1).values;
% figure(1)
% PO=plot(Time,Me(:,1:end)','LineWidth',2);
% grid on
% k=ME;
% Lname = sprintf('time/%d',k)
% legend(Lname,'FontSize',24,'Location','NorthWest')
% title('Effect of sudden MEturbance','FontSize',40);
% xlabel('Time','FontSize',40);
% ylabel('Error (m)','FontSize',40); 
% filename = sprintf('Compu_PosFME%d.fig',k);  % nam eof the figure 'ModelingError_interation'
% file_path="E:\MATLAB_Drive\Final_Hybrid_Reciprocating_Object_Completed_1\FFFB_ME"
% full_filename = strcat(file_path, filename);
% saveas(gcf, full_filename);
% saveas(gcf,'full_filename','epsc')
% figure(2)
% FO=plot(Time,EF(:,1:end)','--','LineWidth',2);
% grid on
% legend(Lname,'FontSize',24,'Location','NorthWest')
% title('Effect of sudden MEturbance','FontSize',40);
% xlabel('Time ','FontSize',40);
% ylabel('Error (N)','FontSize',40); 
% filename = sprintf('Compu_PForce_ME%d.fig',k);  % nam eof the figure 'ModelingError_interation'
% % file_path="E:\MATLAB_Drive\Final_Hybrid_Reciprocating_Object_Completed_1\FFFB_ME"
% full_filename = strcat(file_path, filename);
% saveas(gcf, full_filename);
% saveas(gcf,'full_filename','epsc')
% grid on
[r,c]=size(Time);
if r>c
    jk=r;
else jk=c;
end
if i==1
Error1Des=[Pxd(:,1:end)';Pyd(:,1:end)'];
Error1Act=[Pxa(:,1:end);Pya(:,1:end)];
Error1RV=[Exd(:,1:end)];
ErrorF1=[TimeF;Fd;Fa];
Time1_=Time;
Time1F_=TimeF;
Time1AV_=TimeV;
elseif i==2
Error2Des=[Pxd(:,1:end)';Pyd(:,1:end)'];
Error2Act=[Pxa(:,1:end);Pya(:,1:end)];
Error2RV=[Exd(:,1:end)];
ErrorF2=[TimeF;Fd;Fa];
Time2_=Time;
Time2F_=TimeF;
Time2AV_=TimeV;
elseif i==3
Error3Des=[Pxd(:,1:end)';Pyd(:,1:end)'];
Error3Act=[Pxa(:,1:end);Pya(:,1:end)];
Error3RV=[Exd(:,1:end)];
ErrorF3=[TimeF;Fd;Fa];
Time3_=Time;
Time3F_=TimeF;
Time3AV_=TimeV;
elseif i==4
Error4Des=[Pxd(:,1:end)';Pyd(:,1:end)'];
Error4Act=[Pxa(:,1:end);Pya(:,1:end)];
Error4RV=[Exd(:,1:end)];
ErrorF4=[TimeF;Fd;Fa];
Time4_=Time;
Time4F_=TimeF;
Time4AV_=TimeV;
end
end
% legendInfo={'Mass=1.1','Mass=1.2'};
% hold on
% plot(Time1_,Error1(:,1:end),'linestyle','-','LineWidth',2);
% plot(Time2_,Error2(:,1:end),'linestyle','--','LineWidth',2);
% % plot(Time3_,Error3(:,1:end),'linestyle',':','LineWidth',2);
% % plot(Time4_,Error4(:,1:end),'linestyle','-.','LineWidth',2);    
% title('Effect of modeling error','FontSize',40);
% xlabel('Time','FontSize',40);
% ylabel('Error (m)','FontSize',40); 
% legend(legendInfo,'FontSize',24,'Location','NorthWest')
% hold off
% filename = sprintf('Compu_PosF_ME1234%d');  % nam eof the figure 'ModelingError_interation'
% file_path="E:\MATLAB_Drive\Final_Hybrid_Reciprocating_Object_Completed_1\FFFB_ME"
% full_filename = strcat(file_path, filename);
% saveas(gcf, full_filename);
% grid on
% saveas(gcf,full_filename,'epsc')
% close(gcf);
% hold on
% plot(Time1_,ErrorF1(:,1:end),'linestyle','-','LineWidth',2);
% plot(Time2_,ErrorF2(:,1:end),'linestyle','--','LineWidth',2);
% % plot(Time3_,ErrorF3(:,1:end),'linestyle',':','LineWidth',2);
% % plot(Time4_,ErrorF4(:,1:end),'linestyle','-.','LineWidth',2);      
% grid on
% title('Effect of modeling error','FontSize',40);
% xlabel('Time ','FontSize',40);
% ylabel('Error (N)','FontSize',40); 
% legend(legendInfo,'FontSize',24,'Location','NorthWest')
% hold off
% filename = sprintf('Compu_PForce_ME1234%d');  % nam eof the figure 'ModelingError_interation'
% file_path="E:\MATLAB_Drive\Final_Hybrid_Reciprocating_Object_Completed_1\FFFB_ME"
% full_filename = strcat(file_path, filename);
% grid on
% saveas(gcf, full_filename);
% saveas(gcf,full_filename,'epsc')
% close(gcf);
% save('F1Error.mat','ErrorF1');
% save('F2Error.mat','ErrorF2');
% save('Time1_.mat','Time1_');
% save('Time2_.mat','Time2_');
% FD1=load('F1Error.mat');
% FD2=load('F2Error.mat');
% FT1=load('Time1_.mat');
% FT2=load('Time2_.mat');
% FE1=FD1.ErrorF1;
% FE2=FD2.ErrorF2;
% FE11=FE1;
% FE21=FE2;
% FE1=FT1.Time1_;
% FE2=FT2.Time2_;
% hold on;plot(FE1,FE11,FE2,FE21);hold off;
% save('M1Error.mat','Error1');
% save('M2Error.mat','Error2');
% save('Time1_.mat','Time1_');
% save('Time2_.mat','Time2_');
% LD1=load('M1Error.mat');
% LD2=load('M2Error.mat');
% LT1=load('Time1_.mat');
% LT2=load('Time2_.mat');
% ME1=LD1.Error1(1,1,:);
% ME2=LD2.Error2(1,1,:);
% ME11=ME1(:,1:end);
% ME21=ME2(:,1:end);
% TE1=LT1.Time1_;
% TE2=LT2.Time2_;
% plot(TE1,ME11,TE2,ME21)
% M1_1=[Time1_';Error1(:,1:end);ErrorF1(:,1:end)'];
% save('FFFBActualMass.mat','M1_1');
% M1_2=[Time2_';Error2(:,1:end);ErrorF2(:,1:end)'];
% save('FFFBArbitaryMass1_2.mat','M1_2');
% Error1Des=[Pxd(:,1:end)';Pyd(:,1:end)'];
% Error1Act=[Pxa(:,1:end);Pya(:,1:end)];
% Error1RV=[Exd(:,1:end)];
% ErrorF1=[TimeF;Fd;Fa];
% Time1_=Time;
% % Time1F_=TimeF;
% Time1AV_=TimeV;

M1_1=[Time1_';Error1Des;Error1Act;Error1RV];
save('FFFBArbitary_Pos1_1.mat', 'M1_1');
save('FFFBArbitary_force1_1.mat', 'ErrorF1');
M1_2=[Time2_';Error2Des;Error2Act;Error2RV];
save('FFFBArbitary_Pos2_1.mat', 'M1_2');
save('FFFB_Arbitary_froce1_2.mat', 'ErrorF2');
M1_3=[Time3_';Error3Des;Error3Act;Error3RV];
save('FFFBArbitary_Pos3_1.mat', 'M1_3');
save('FFFB_Arbitary_froce3_2.mat', 'ErrorF3');
M1_4=[Time4_';Error4Des;Error4Act;Error4RV];
save('FFFBArbitary_Pos4_1.mat', 'M1_4');
save('FFFB_Arbitary_froce4_2.mat', 'ErrorF4');

