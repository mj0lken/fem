%% Project
% clear all
% clc

%Loading all constants, including constitive matrices and mesh values
project_constants;

%Converts mesh data to calfem output
mesh_to_calfem;


K = zeros(ndof);
C = zeros(ndof);
f = zeros(ndof,1);


% Sorting edof,Ex,Ey to the different materials as well as finding
%which element belongs to which element
% sorting_edof_ex_ey;

method_2;


% eldraw2(Ex,Ey,[1,2,1],edof(:,1)); 





% Next : N-matrix!
% N_matrix;

%Creates the global K-matrix. 
% K_matrix;

%Solving the stationary heat

a_stationary = solve(K,f);

%Creates the C_matrix
% C_matrix;

%Convert to degrees


% transient_heat_flow;


a_stationary = a_stationary-273.15;
% a_t = a_t -273.15;

%Plotting the temperature field
ed = extract(edof,a_stationary);

% colormap(hot)
fill(ex',ey',ed');

%Solving task number two 

