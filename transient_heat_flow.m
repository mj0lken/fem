%Solving the transient heat flow

anew = ones(ndof,1)*T0;
dt = 1;
a_t = anew;
for t = 1:100
%     pause(0.01);
    ed = extract(edof,anew);
%     fill(ex',ey',ed');
    anew = time_step_heat_flow(anew,C,K,f,dt);
    a_t = [a_t,anew];
end




