K = zeros(ndof);
C = zeros(ndof);
f = zeros(ndof,1);


for i = 1:length(edof)
    
    if(t(4,i) == 1)
        Ke = flw2te(ex(i,:),ey(i,:),thickness,D_pcb);
        K = assem(edof(i,:),K,Ke);
         Ce = plantml(ex(i,:),ey(i,:),c_pcb*p_pcb);
         C = assem(edof(i,:),C,Ce);
    elseif(t(4,i) == 2)
        Ke = flw2te(ex(i,:),ey(i,:),thickness,D_sol);
        K = assem(edof(i,:),K,Ke);
        Ce = plantml(ex(i,:),ey(i,:),c_pcb*p_pcb);
        C = assem(edof(i,:),C,Ce);
    elseif(t(4,i) == 3)
        Ke = flw2te(ex(i,:),ey(i,:),thickness,D_smd);
        K = assem(edof(i,:),K,Ke);
        Ce = plantml(ex(i,:),ey(i,:),c_pcb*p_pcb);
        C = assem(edof(i,:),C,Ce);
        
    end
    
end

for i = 1:length(e)
    x1 = coord(e(1,i),1);
    y1 = coord(e(1,i),2);
    x2 = coord(e(2,i),1);
    y2 = coord(e(2,i),2);
    Le = hypot(x1-x2,y1-y2);
    if(e(5,i) == 4)
            f(e(1,i)) = f(e(1,i)) + (Le/2)*a_c*T_infty;
            f(e(2,i)) = f(e(2,i)) + (Le/2)*a_c*T_infty;
            Kc = (a_c*Le)/6*[2 1;1 2];
            te = [e(1,i), e(2,i)];
            K(te,te) = K(te,te)+Kc;

    elseif(e(5,i) == 3)
        if(coord(e(1,i),1) <= 0.20001e-3 && coord(e(2,i),1) <= 0.20001e-3)
            f(e(1,i)) = f(e(1,i)) + (Le/2)*q_el;
            f(e(2,i)) = f(e(2,i)) + (Le/2)*q_el;
           
        else
            f(e(1,i)) = f(e(1,i)) + (Le/2)*a_c*T_infty;
            f(e(2,i)) = f(e(2,i)) + (Le/2)*a_c*T_infty;
            Kc = (a_c*Le)/6*[2 1;1 2];
            te = [e(1,i), e(2,i)];
            K(te,te) = K(te,te)+Kc;

        end
    end
end

%Solving the stationary heat
a_stationary = solve(K,f);

 ed = extract(edof,a_stationary-273.15);
  figure(1)
  h = fill(ex',ey',ed');
  title({'Stationary heat flow'});
  c = colorbar;
  xlabel('x (m)','FontSize',12);
  ylabel('y (m)','FontSize',12);
  ylabel(c,'^{\circ}C','FontSize',15);
  set(h,'EdgeColor','none')
  colormap(jet);
  hold off;
 
    