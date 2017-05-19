function [ Ke ] = plantf0(ex,ey,D,e0 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
C=[ 1  ex(1) ey(1)   0     0       0  
    0    0     0     1   ex(1)   ey(1)
    1  ex(2) ey(2)   0     0       0  
    0    0     0     1   ex(2)   ey(2)
    1  ex(3) ey(3)   0     0       0  
    0    0     0     1   ex(3)   ey(3)];

A=1/2*det([ones(3,1) ex' ey']);

B=[0 1 0 0 0 0
    0 0 0 0 0 1
    % 0 0 0 0 0 0
    0 0 1 0 1 0]*inv(C);

colD=size(D,2);
if colD>3
    Dm=D([1 2 4],[1 2 4]);
else
    Dm=D;
end

Ke=B'*Dm*e0*A;
        
end

