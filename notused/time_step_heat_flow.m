function [ anew ] = time_step_heat_flow( aold, C, K,f, dt)
%UNTITLED2 Summary of this function goes here
%  Takes a time step for the heat flow

anew = (C+K*dt)\(dt*f + C*aold);


end

