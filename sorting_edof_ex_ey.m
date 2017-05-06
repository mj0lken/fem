%Sorting Ex,Ey and edof to different materials and finding the ones that
%belong to the border
Ex1 = [];Ex2 = [];Ex3 = [];
Ey1 = [];Ey2 = [];Ey3 = [];
edof1 = []; edof2 = []; edof3 = [];
E1x = []; E1y = []; E2x = []; E2y = []; E3x = []; E3y = [];
edof_boundry1 = []; edof_boundry2 = []; edof_boundry3 = [];
% ^ for calculating N for boundary 1 and 2(and 3)

for i = 1:nelm
    if t(4,i) == 1
        edof1 = [edof1;edof(i,:)];
        Ex1 = [Ex1;Ex(i,:)];
        Ey1 = [Ey1;Ey(i,:)];
    elseif t(4,i) == 3
        edof2 = [edof2;edof(i,:)];
        Ex2 = [Ex2;Ex(i,:)];
        Ey2 = [Ey2;Ey(i,:)];
    elseif t(4,i) == 2
        edof3 = [edof3;edof(i,:)];
        Ex3 = [Ex3;Ex(i,:)];
        Ey3 = [Ey3;Ey(i,:)];
    end
    
    rand = element_to_rand(Ex(i,:), Ey(i,:));
    if(rand == 1)
        E1x = [E1x;Ex(i,:)];
        E1y = [E1y;Ey(i,:)];
        edof_boundry1 = [edof_boundry1;edof(i,:)];
    elseif(rand == 2)
        edof_boundry2 = [edof_boundry2;edof(i,:)];
        E2x = [E2x;Ex(i,:)];
        E2y = [E2y;Ey(i,:)];
    elseif(rand == 3)
        edof_boundry3 = [edof_boundry3;edof(i,:)];
        E3x = [E3x;Ex(i,:)];
        E3y = [E3y;Ey(i,:)];
    end   
end


Ex = [Ex1;Ex2;Ex3];
Ey = [Ey1;Ey2;Ey3];
edof = [edof1;edof2;edof3];
edof(:,1) = 1:nelm;