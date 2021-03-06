%This contains all constants.

load('e.mat');
load('p.mat');
load('t.mat');



E_smd = 105e9; %Pa
v_smd = 0.118; 
k_smd = 0.29;%W/mK
p_smd = 1850; %kg/m^3
c_smd = 950; %J/kgK
alpha_smd = 1.2e-5; %1/K
E_pcb = 105e9; %Pa
v_pcb = 0.136;
k_pcb = 1.059; % W/mK
p_pcb = 1850; %kg/m^3
c_pcb = 950; %J/kgK
alpha_pcb = 2*1e-5; %1/K
E_sol = 50e9; %Pa
v_sol = 0.36; 
k_sol = 66.8; %W/mK
p_sol = 7265; %kg/m^3
c_sol = 210; %J/kgK
alpha_sol = 1.2e-5; %1/K
T0 = 30+273.15; %Kelvin
% T0 = 30; %degrees
a_c = 40; %W/m^2K
q_el = 9e3; %W/m^2
T_infty = 20+273.15; %Kelvin
% T_infty = 20; %degrees
thickness = 1; %of whatever

%Consitutive matrices
%Part1
D_pcb = [k_pcb 0; 0 k_pcb];
D_smd = [k_smd 0; 0 k_smd];
D_sol = [k_sol 0; 0 k_sol];
%Part2
D_pcb2 = E_pcb/((1+v_pcb)*(1-2*v_pcb))*[1-v_pcb,v_pcb,0;v_pcb,1-v_pcb,0;0,0,1/2*(1-2*v_pcb)];
D_smd2 = E_smd/((1+v_smd)*(1-2*v_smd))*[1-v_smd,v_smd,0;v_smd,1-v_smd,0;0,0,1/2*(1-2*v_smd)];
D_sol2 = E_sol/((1+v_sol)*(1-2*v_sol))*[1-v_sol,v_sol,0;v_sol,1-v_sol,0;0,0,1/2*(1-2*v_sol)];

