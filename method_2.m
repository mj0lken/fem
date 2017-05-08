
for i = 1:size(edof(:,1))
    
    if(t(4,i) == 1)
        [Ke, fe] = flw2te(ex(i,:),ey(i,:),thickness,D_pcb,0);
        [K,f] = assem(edof(i,:),K,Ke,f,fe);
         Ce = plantml(ex(i,:),ey(i,:),c_pcb*p_pcb);
         C = assem(edof,C,Ce);
    elseif(t(4,i) == 2)
        [Ke, fe] = flw2te(ex(i,:),ey(i,:),thickness,D_sol,0);
        [K,f] = assem(edof(i,:),K,Ke,f,fe);
        Ce = plantml(ex(i,:),ey(i,:),c_pcb*p_pcb);
        C = assem(edof,C,Ce);
    elseif(t(4,i) == 3)
        [Ke, fe] = flw2te(ex(i,:),ey(i,:),thickness,D_smd,0);
        [K,f] = assem(edof(i,:),K,Ke,f,fe);
        Ce = plantml(ex(i,:),ey(i,:),c_pcb*p_pcb);
        C = assem(edof,C,Ce);
        
    end
    
end

for i = 1:size(e(1,:)')
    x1 = coord(e(1,i),1);
    y1 = coord(e(1,i),2);
    x2 = coord(e(2,i),1);
    y2 = coord(e(2,i),2);
    if(e(5,i) == 4)
           Le = hypot(x1-x2,y1-y2);
            f(e(1,i)) = f(e(1,i)) + (Le/2)*a_c*T_infty;
            f(e(2,i)) = f(e(2,i)) + (Le/2)*a_c*T_infty;
            %This method needs to be explained:
            M = (a_c*Le)/6*[2 1;1 2];
            t = [e(1,i), e(2,i)];
            K(t,t) = K(t,t)+M;

    elseif(e(5,i) == 3)
        Le = coord(e(1,i),1) - coord(e(2,i),1);
        if(coord(e(1,i),1) <= 0.20001e-3 && coord(e(2,i),1) <= 0.20001e-3)
            f(e(1,i)) = f(e(1,i)) + (Le/2)*q_el;
            f(e(2,i)) = f(e(2,i)) + (Le/2)*q_el;
           
        else
            f(e(1,i)) = f(e(1,i)) + (Le/2)*a_c*T_infty;
            f(e(2,i)) = f(e(2,i)) + (Le/2)*a_c*T_infty;
            %This method needs to be explained:
            M = (a_c*Le)/6*[2 1;1 2];
            t = [e(1,i), e(2,i)];
            K(t,t) = K(t,t)+M;

        end
    end
end

    