% Adams / MATLAB Interface - Release 2018.1.0
global ADAMS_sysdir; % used by setup_rtw_for_adams.m
global ADAMS_host; % used by start_adams_daemon.m
machine=computer;
datestr(now)
if strcmp(machine, 'GLNXA64')
   arch = 'linux64';
elseif strcmp(machine, 'PCWIN64')
   arch = 'win64';
else
   disp( '%%% Error : Platform unknown or unsupported by Adams Controls.' ) ;
   arch = 'unknown_or_unsupported';
   return
end
   [flag, topdir]=system('adams2018_1 -top');
if flag == 0
  temp_str=strcat(topdir, '/controls/', arch);
  addpath(temp_str)
  temp_str=strcat(topdir, '/controls/', 'matlab');
  addpath(temp_str)
  temp_str=strcat(topdir, '/controls/', 'utils');
  addpath(temp_str)
  ADAMS_sysdir = strcat(topdir, '');
else
  addpath( 'C:\PROGRA~1\MSC~1.SOF\Adams\2018_1\controls/win64' ) ;
  addpath( 'C:\PROGRA~1\MSC~1.SOF\Adams\2018_1\controls/matlab' ) ;
  addpath( 'C:\PROGRA~1\MSC~1.SOF\Adams\2018_1\controls/utils' ) ;
  ADAMS_sysdir = 'C:\PROGRA~1\MSC~1.SOF\Adams\2018_1\' ;
end
ADAMS_exec = '' ;
ADAMS_host = 'KDoMPC-02' ;
ADAMS_cwd ='D:\VishalPhD\Final_Hybrid_Reciprocating_Object_Completed'  ;
ADAMS_prefix = 'Controls_Plant_1' ;
ADAMS_static = 'no' ;
ADAMS_solver_type = 'C++' ;
ADAMS_version = '2018_1' ;
if exist([ADAMS_prefix,'.adm']) == 0
   disp( ' ' ) ;
   disp( '%%% Warning : missing Adams plant model file(.adm) for Co-simulation or Function Evaluation.' ) ;
   disp( '%%% If necessary, please re-export model files or copy the exported plant model files into the' ) ;
   disp( '%%% working directory.  You may disregard this warning if the Co-simulation/Function Evaluation' ) ;
   disp( '%%% is TCP/IP-based (running Adams on another machine), or if setting up MATLAB/Real-Time Workshop' ) ;
   disp( '%%% for generation of an External System Library.' ) ;
   disp( ' ' ) ;
end
ADAMS_init = '' ;
ADAMS_inputs  = 'T1!T2' ;
ADAMS_outputs = 't1dd!t2dd!Pddx!Pddy!Fn1!Fn2' ;
ADAMS_pinput = 'Controls_Plant_2.ctrl_pinput' ;
ADAMS_poutput = 'Controls_Plant_2.ctrl_poutput' ;
ADAMS_uy_ids  = [
                   1
                   2
                   3
                   4
                   5
                   6
                   7
                   8
                ] ;
ADAMS_mode   = 'non-linear' ;
tmp_in  = decode( ADAMS_inputs  ) ;
tmp_out = decode( ADAMS_outputs ) ;
disp( ' ' ) ;
disp( '%%% INFO : ADAMS plant actuators names :' ) ;
disp( [int2str([1:size(tmp_in,1)]'),blanks(size(tmp_in,1))',tmp_in] ) ;
disp( '%%% INFO : ADAMS plant sensors   names :' ) ;
disp( [int2str([1:size(tmp_out,1)]'),blanks(size(tmp_out,1))',tmp_out] ) ;
disp( ' ' ) ;
clear tmp_in tmp_out ;
% Adams / MATLAB Interface - Release 2018.1.0
