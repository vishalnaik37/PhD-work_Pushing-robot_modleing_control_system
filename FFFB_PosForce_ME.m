clear all
Ts=0.001;
K=load('W_Point');
T1=K.out.WP11.time+40+Ts;
X1=K.out.WP11.signals(1).values;
Y1=K.out.WP11.signals(2).values;
F1=K.out.WP11.signals(3).values;
Xd1=K.out.WP21.signals(1).values;
Yd1=K.out.WP21.signals(2).values;
Fd1=K.out.WP21.signals(3).values;
Xdd1=K.out.WP31.signals(1).values;
Ydd1=K.out.WP31.signals(2).values;
Fdd1=K.out.WP31.signals(3).values;

T0=K.out.WP10.time;
X0=K.out.WP10.signals(1).values;
Y0=K.out.WP10.signals(2).values;
F0=K.out.WP10.signals(3).values;
Xd0=K.out.WP20.signals(1).values;
Yd0=K.out.WP20.signals(2).values;
Fd0=K.out.WP20.signals(3).values;
Xdd0=K.out.WP30.signals(1).values;
Ydd0=K.out.WP30.signals(2).values;
Fdd0=K.out.WP30.signals(3).values;

T2=K.out.WP12.time+80+2*Ts;
X2=K.out.WP12.signals(1).values;
Y2=K.out.WP12.signals(2).values;
F2=K.out.WP12.signals(3).values;
Xd2=K.out.WP22.signals(1).values;
Yd2=K.out.WP22.signals(2).values;
Fd2=K.out.WP22.signals(3).values;
Xdd2=K.out.WP32.signals(1).values;
Ydd2=K.out.WP32.signals(2).values;
Fdd2=K.out.WP32.signals(3).values;


T=[T0',T1',T2'];
X=[X0',X1',X2'];
Y=[Y0',Y1',Y2'];
F_=[F0',F1',F2']
P=[X;Y;F_];

Xd=[Xd0',Xd1',Xd2'];
Yd=[Yd0',Yd1',Yd2'];
Fd_=[Fd0',Fd1',Fd2'];
Pd=[Xd;Yd;Fd_];

Xdd=[Xdd0',Xdd1',Xdd2'];
Ydd=[Ydd0',Ydd1',Ydd2'];
Fdd_=[Fdd0',Fdd1',Fdd2'];
Pdd=[Xdd;Ydd;Fdd_];

P=[X2';Y2';F2'];
Pd=[Xd2';Yd2';Fd2'];
Pdd=[Xdd2';Ydd2';Fdd2']
T=K.out.WP11.time'
Ki=0.1;
Kd=0.5;
Kpf=0.5;
Kif=(1+Kpf)*log(10^4);
Kp=16;
% Kp=0.1;
kd=0.5;
Kp1=10;
Kd1=1;

E=[1,1.2,1.4,1.6];
% % E1=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,18,19,20,-17,-18,-19,-20]*0.025/20;
% E=[1,2,3,4,5,6,7,8,9,10,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,]*5;

for i=3
TS=T(end);  % time to run the code
% Ds=10; % Transport Delay


ME=E(i);  % in percentage
% dis=E(i); % Disturbance

sim('Final_Reciprocating_Simscape_19_08_24_ME');
% sim('Final_Computed_FFB_Contact');

Pxd=ans.ScopeData1.signals(1).values;
Pyd=ans.ScopeData1.signals(2).values;
Pxa=ans.ScopeData1.signals(3).values;
Pya=ans.ScopeData1.signals(4).values;
Time=ans.ScopeData1.time;
Fa=ans.ScopeData2.signals(1).values;
Fd=ans.ScopeData2.signals(2).values;
figure;
Exd=ans.ScopeData3.signals(1).values;
% Eyd=ans.ScopeData3.signals(2).values;
Time=ans.ScopeData3.time;
[r,c]=size(Time);
Me=Exd;
EF=ans.ScopeData4.signals(1).values;
figure(1)
PO=plot(Time,Me(:,1:end)','LineWidth',2);
grid on
k=ME;
Lname = sprintf('time/%d',k)
legend(Lname,'FontSize',24,'Location','NorthWest')
title('Effect of sudden MEturbance','FontSize',40);
xlabel('Time','FontSize',40);
ylabel('Error (m)','FontSize',40); 
filename = sprintf('Ada_PosFME%d.fig',k);  % nam eof the figure 'ModelingError_interation'
file_path="C:\PHD\Matlab_Drive\Final_Hybrid_Reciprocating_Object_Completed_1\FFFB_ME\"
full_filename = strcat(file_path, filename);
saveas(gcf, full_filename);
saveas(gcf,'full_filename','epsc')

figure(2)
FO=plot(Time,EF(:,1:end)','--','LineWidth',2);
grid on
legend(Lname,'FontSize',24,'Location','NorthWest')
title('Effect of sudden MEturbance','FontSize',40);
xlabel('Time ','FontSize',40);
ylabel('Error (N)','FontSize',40); 
filename = sprintf('Ada_PForce_ME%d.fig',k);  % nam eof the figure 'ModelingError_interation'
file_path="C:\PHD\Matlab_Drive\Final_Hybrid_Reciprocating_Object_Completed_1\FFFB_ME\"
full_filename = strcat(file_path, filename);
saveas(gcf, full_filename);
saveas(gcf,'full_filename','epsc')
grid on
[r,c]=size(Time);
if r>c
    jk=r;
else jk=c;
end
if i==1
    Error1=Me;
    ErrorF1=EF;
    Time1_=Time;
elseif i==2
        Error2=Me;
    ErrorF2=EF;
       Time2_=Time;
elseif i==3
        Error3=Me;
    ErrorF3=EF;
       Time3_=Time;
else
       Error4=Me;
       ErrorF4=EF;
       Time4_=Time;
end

end
legendInfo={'Nochange','Mass=1.2','Mass=1.4','Mass=1.6','Mass=1.8'};
hold on
plot(Time1_,Error1(:,1:end),'linestyle','-','LineWidth',2);
plot(Time2_,Error2(:,1:end),'linestyle','--','LineWidth',2);
plot(Time3_,Error3(:,1:end),'linestyle',':','LineWidth',2);
plot(Time4_,Error4(:,1:end),'linestyle','-.','LineWidth',2);    
title('Effect of modeling error','FontSize',40);
xlabel('Time','FontSize',40);
ylabel('Error (m)','FontSize',40); 
legend(legendInfo,'FontSize',24,'Location','NorthWest')
hold off
filename = sprintf('Ada_PosF_ME1234%d');  % nam eof the figure 'ModelingError_interation'
file_path="C:\PHD\Matlab_Drive\Final_Hybrid_Reciprocating_Object_Completed_1\FFFB_ME\"
full_filename = strcat(file_path, filename);
saveas(gcf, full_filename);
grid on
saveas(gcf,'full_filename','epsc')
close(gcf);
hold on
plot(Time1_,ErrorF1(:,1:end),'linestyle','-','LineWidth',2);
plot(Time2_,ErrorF2(:,1:end),'linestyle','--','LineWidth',2);
plot(Time3_,ErrorF3(:,1:end),'linestyle',':','LineWidth',2);
plot(Time4_,ErrorF4(:,1:end),'linestyle','-.','LineWidth',2);      
grid on
title('Effect of modeling error','FontSize',40);
xlabel('Time ','FontSize',40);
ylabel('Error (N)','FontSize',40); 
legend(legendInfo,'FontSize',24,'Location','NorthWest')
hold off
filename = sprintf('Ada_PForce_ME1234%d');  % nam eof the figure 'ModelingError_interation'
file_path="C:\PHD\Matlab_Drive\Final_Hybrid_Reciprocating_Object_Completed_1\FFFB_ME\"
full_filename = strcat(file_path, filename);
grid on
saveas(gcf, full_filename);
saveas(gcf,'full_filename','epsc')
close(gcf);

