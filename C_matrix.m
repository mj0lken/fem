%Calculating the C-matrix
%Plantml seems to do the trick!
C = zeros(ndof);

for i = 1:size(edof1(:,1))
    Ce = plantml(Ex1(i,:),Ey1(i,:),c_pcb*p_pcb);
    C = assem(edof1,C,Ce);
end

for i = 1:size(edof2(:,1))
    Ce = plantml(Ex2(i,:),Ey2(i,:),c_smd*p_smd);
    C = assem(edof2,C,Ce); 
end

for i = 1:size(edof3(:,1))
    Ce = plantml(Ex3(i,:),Ey3(i,:),c_sol*p_sol);
    C = assem(edof3,C,Ce);   
end


