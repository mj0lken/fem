%Solving the transient heat flow
time = 300;
a = ones(ndof,1)*T0;
dt = 1;
a_t = zeros(ndof,time);

for i = 1:time
    pause(0.01);
    ed = extract(edof,a-273.15);
    fill(ex',ey',ed');
    colormap(jet);
    caxis([20, 80])
    colorbar
    a = (C+K*dt)\(dt*f + C*a);
%     anew = time_step_heat_flow(anew,C,K,f,dt);
    a_t = [a_t,a];
end




