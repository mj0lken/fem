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

eldraw2(Ex,Ey,[1,2,1],edof(:,1)); 




% Next : N-matrix!
N_matrix;
% C = [ones(3,1) ex' ey'];
% Ne = [1 x y]*inv(C);


%Creates the global K-matrix. 
K_matrix;


