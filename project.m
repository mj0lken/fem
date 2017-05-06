%% Project
clear all
clc

%Loading all constants, including constitive matrices and mesh values
project_constants;

%Converts mesh data to calfem output
mesh_to_calfem;

%Sorting edof,Ex,Ey to the different materials as well as finding
%which element belongs to which element
sorting_edof_ex_ey;

% eldraw2(Ex,Ey,[1,2,1],edof(:,1)); 



K = zeros(ndof);
f = zeros(ndof,1);
% Next : N-matrix!
N_matrix;

%Creates the global K-matrix. 
K_matrix;

%Solving the stationary heat

a_stationary = solve(K,f);

%Creates the C_matrix
C_matrix;

%Solving the transient heat flow
anew = ones(ndof,1)*T0;
dt = 1;
a_t = anew;
for t = 1:100
    pause(0.01);
    ed = extract(edof,anew);
    fill(Ex',Ey',ed');
    anew = time_step_heat_flow(anew,C,K,f,dt);
    a_t = [a_t,anew];
end

%Convert to degrees
a_stationary = a_stationary-273.15;
a_t = a_t -273.15;


%Plotting the temperature field
ed = extract(edof,a_stationary);

% colormap(hot)
fill(Ex',Ey',ed');
   


%Solving task number two 

