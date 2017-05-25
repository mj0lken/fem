%Solving the transient heat flow
time = 1000;
a = ones(ndof,1)*T0;
dt = 1;
a_t = [];

for i = 1:time
    a_t = [a_t,a];
    a = (C+K*dt)\(dt*f + C*a);
%     anew = time_step_heat_flow(anew,C,K,f,dt);
end

timenbr = 1;
for i = 2:6
    figure(i)
    if(i == 6)
        timenbr = 1000;
    end
    ed = extract(edof,a_t(:,timenbr)-274.15);
    timenbr = timenbr+20;
    h = fill(ex',ey',ed');
    title('Transient heat flow','FontSize', 20);
    c = colorbar;
    xlabel('x (m)','FontSize',18);
    ylabel('y (m)','FontSize',18);
    ylabel(c,'^{\circ}C','FontSize',18);
    set(gca,'fontsize',14)
    caxis([29, 75]);
    colormap(jet);
%     set(h,'EdgeColor','none')
end

figure(7)
h = fill(ex',ey',ed');
title('Transient heat flow','FontSize', 20);
xlabel('x (m)','FontSize',18);
ylabel('y (m)','FontSize',18);
ylabel(c,'^{\circ}C','FontSize',18);
set(gca,'fontsize',14)
colorbar;
colormap(jet);
% set(h,'EdgeColor','none')