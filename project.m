%% Project
clear all
clc

%Loading all constants, including constitive matrices and mesh values
project_constants;

%Converts mesh data to calfem output
mesh_to_calfem;


K = zeros(ndof);
C = zeros(ndof);
f = zeros(ndof,1);

%Solver K, C, Kc and f
FE_solver;

%Solving the stationary heat

a_stationary = solve(K,f);

% transient_heat_flow;


a_stationary = a_stationary-273.15;
% a_t = a_t -273.15;

%Plotting the temperature field
ed = extract(edof,a_stationary);

% colormap(hot)
fill(ex',ey',ed');
colorbar
%Solving task number two 

