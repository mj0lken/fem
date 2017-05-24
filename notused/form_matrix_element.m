function [ Ne ] = form_matrix_element( ex, ey, x ,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

C = [ones(3,1) ex' ey'];
Ne = [1 x y]*inv(C);

end

