%% Project
clear all
clc
addpath(genpath('calfem'))

%Loading all constants, including constitive matrices and mesh values
project_constants;

%Converts mesh data to calfem output
mesh_to_calfem;


%Computing the stationary heat flow
heat_flow;


%Computing the transient heat flow 
transient_heat_flow;

%Computing the von Mises stress field and the displacement field
part2;

