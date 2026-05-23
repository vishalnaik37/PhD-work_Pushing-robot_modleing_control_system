TunnedBlocks={'PI'};
STO=slTuner('DM_11_10_23_6',TunnedBlocks);
% STO=slTuner('PF_Control_9_model_based',TunnedBlocks);

addPoint(STO,TunnedBlocks);
addPoint(STO,{'Robo1/Fa'});
RefSignals={'Force/Fd'};
addPoint(STO,RefSignals);

%% Defining Input and output and Tunning the system
Controls=TunnedBlocks;
Measurments={'Robo1/Fa'};
Options=looptuneOptions('RandomStart',80,'UseParallel',false);
Ts=0.001;
TR=TuningGoal.StepTracking(RefSignals,Measurments,Ts,0);
ST1=looptune(STO,Controls,Measurments,TR,Options);
%%% Upadte PID Block
writeBlockValue(ST1);
% line = find_system(gcs, 'SearchDepth', 1, 'FindAll', 'on', ...
%       'Type', 'line', 'Selected', 'on');
% linepath = getfullname(line)
