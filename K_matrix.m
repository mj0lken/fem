%This is for solving the K-matrix


for i = 1:size(edof1(:,1))
    [Ke, fe] = flw2te(Ex1(i,:),Ey1(i,:),thickness,D_pcb,0);
    [K,f] = assem(edof1(i,:),K,Ke,f,fe);
end


for i = 1:size(edof2(:,1))
    [Ke, fe] = flw2te(Ex2(i,:),Ey2(i,:),thickness,D_smd,0);
    [K,f] = assem(edof2(i,:),K,Ke,f,fe);
end


for i = 1:size(edof3(:,1))
    [Ke, fe] = flw2te(Ex3(i,:),Ey3(i,:),thickness,D_sol,0);
    [K,f] = assem(edof3(i,:),K,Ke,f,fe);
end
