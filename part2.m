
%Building the new edof matrix
edof_load = zeros(nelm,7);
for i = 1:nelm
    n1 = edof(i,2)*2-1;
    n2 = edof(i,2)*2;
    
    n3 = edof(i,3)*2-1;
    n4 = edof(i,3)*2;
    
    n5 = edof(i,4)*2-1;
    n6 = edof(i,4)*2;
    
    edof_load(i,:) = [nelm,n1,n2,n3,n4,n5,n6];
end


%Building the stiffness matrix(K_load) and force vector(f-load)
K_load = zeros(ndof*2);
f_load = zeros(ndof*2,1);
ep = [2 thickness];

deltaT = a_stationary - T0;


for i = 1:length(edof_load)
    
    T_element = (deltaT(edof(i,2))+deltaT(edof(i,3))+deltaT(edof(i,4)))/3;
    if(t(4,i) == 1)       
        Ke = plante(ex(i,:),ey(i,:),ep,D_pcb2);        
        e0 = (1+v_pcb)*alpha_pcb*T_element*[1;1;0];
        f0 = plantf0(ex(i,:),ey(i,:),D_pcb2,e0);
        [K_load,f_load] = assem(edof_load(i,:),K_load,Ke,f_load,f0);

    elseif(t(4,i) == 2)
        Ke = plante(ex(i,:),ey(i,:),ep,D_sol2);
        e0 = (1+v_sol)*alpha_sol*T_element*[1;1;0];
        f0 = plantf0(ex(i,:),ey(i,:),D_sol2,e0);
        [K_load,f_load] = assem(edof_load(i,:),K_load,Ke,f_load,f0);

        
    elseif(t(4,i) == 3)
        Ke = plante(ex(i,:),ey(i,:),ep,D_smd2);
        e0 = (1+v_smd)*alpha_smd*T_element*[1;1;0];
        f0 = plantf0(ex(i,:),ey(i,:),D_smd2,e0);
        [K_load,f_load] = assem(edof_load(i,:),K_load,Ke,f_load,f0);

    end
end


%Creating the boundary conditions vector
bc = [];
 for i = 1:length(e)
    if(e(5,i) == 1 || e(5,i) == 5 || e(5,i) == 6)
        bc = [bc;e(1,i)*2-1, 0];
        bc = [bc;e(2,i)*2-1, 0];
    end
    if(e(5,i) == 2)
        bc = [bc;e(1,i)*2, 0];
        bc = [bc;e(2,i)*2, 0];   
    end
 end
 
a_u = solve(K_load,f_load,bc);
ed = extract(edof_load,a_u);

%Computing the von Mises stress field
Seff_el = zeros(ndof,1);
for i = 1:length(edof_load)
    T_element = (deltaT(edof(i,2))+deltaT(edof(i,3))+deltaT(edof(i,4)))/3;
    if(t(4,i) == 1)       
       [es,et] = plants(ex(i,:),ey(i,:),ep,D_pcb2,ed(i,:));
       sigma_zz = v_pcb*(es(1)+es(2))-alpha_pcb*E_pcb*T_element;

    elseif(t(4,i) == 2)
        [es,et] = plants(ex(i,:),ey(i,:),ep,D_sol2,ed(i,:));
        sigma_zz = v_sol*(es(1)+es(2))-alpha_sol*E_sol*T_element;

    elseif(t(4,i) == 3)
        [es,et] = plants(ex(i,:),ey(i,:),ep,D_smd2,ed(i,:));
        sigma_zz = v_smd*(es(1)+es(2))-alpha_smd*E_smd*T_element;
    end
    
    Seff_el(i) = sqrt(es(1)^2 + es(2)^2+ sigma_zz^2 -(es(1)*es(2)) ...
    -(es(1)*sigma_zz) - (es(2)*sigma_zz) + 3*es(3)^2);
    
end

Seff_nod = zeros(ndof,1);

for i=1:size(coord,1)
    [c0,c1]=find(edof(:,2:4)==i);
    Seff_nod(i,1)=sum(Seff_el(c0))/size(c0,1);
end

ed = extract(edof,Seff_nod);
figure(8);
fill(ex',ey',ed');
title({'Von Mises stress field'});
c = colorbar;
xlabel('x (m)','FontSize',12);
ylabel('y (m)','FontSize',12);
ylabel(c,'Pa','FontSize',15);
colormap(jet);
 
 
%Computing the displacement field
figure(9)
eldraw2(ex,ey,[1,2,1])  
 for i = 1:2:size(a_u)
     pos = (i+1)/2;
     coord(pos,1) = coord(pos,1)+a_u(i)*5e1;
     coord(pos,2) = coord(pos,2) + a_u(i+1)*5e1;
 end
 
 [ex,ey]=coordxtr(edof,coord,(1:ndof)',3); 
eldraw2(ex,ey,[1,4,2])  
xlabel('x (m)','FontSize',12);
ylabel('y (m)','FontSize',12);