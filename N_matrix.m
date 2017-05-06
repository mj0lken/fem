% Creates the N-matrix for the different areas. 

%Boundary 1:

for i = 1:size(edof_boundry1(:,1))
    C = [ones(3,1) E1x(i,:)' E1y(i,:)'];
    Ne = @(x) [1, x, 0.6e-03]/(C)*q_el;
     xmin = min(E1x(i,:));
     xmax = max(E1x(i,:));
     Ke = zeros(3);
     fe =  integral(Ne,xmin,xmax,'ArrayValued',true)';
    [K,f] = assem(edof_boundry1(i,:),K,Ke,f,fe);
end


% Convection for boundary 2:

for i = 1:size(edof_boundry2(:,1))
    C = [ones(3,1) E2x(i,:)' E2y(i,:)'];
    Ne = @(x) [1, x, 0.6e-03]/(C)*a_c*T_infty;
     xmin = min(E2x(i,:));
     xmax = max(E2x(i,:));
     Ke = zeros(3);
     fe =  integral(Ne,xmin,xmax,'ArrayValued',true)';
    [K,f] = assem(edof_boundry2(i,:),K,Ke,f,fe);
end


%Convection for boundary 3

for i = 1:size(edof_boundry3(:,1))
    [Y,I] = max(E3y(i,:));
    xmin = E3x(i,I);
    xmax = max(E3x(i,:));
    C = [ones(3,1) E3x(i,:)' E3y(i,:)'];
    Ne = @(t) [1, t, -t+1.2e-03]/(C)*a_c*sqrt(2)*T_infty; %I've changed from (x,y) -> t(x,y)
     Ke = zeros(3);
     fe = integral(Ne,xmin,xmax,'ArrayValued',true)';
    [K,f] = assem(edof_boundry3(i,:),K,Ke,f,fe);
end



% % Calculating the M value for boundary 2
% 
for i = 1:size(edof_boundry2(:,1))
    C = [ones(3,1) E2x(i,:)' E2y(i,:)'];
    Ne = @(x) ([1, x, 0.6e-03]/(C))'*([1, x, 0.6e-03]/(C))*a_c;
     xmin = min(E2x(i,:));
     xmax = max(E2x(i,:));
     Ke =  integral(Ne,xmin,xmax,'ArrayValued',true)';
     K = assem(edof_boundry2(i,:),K,Ke);
end

% Calculating the M value for boundary 3
% 
for i = 1:size(edof_boundry3(:,1))
    [Y,I] = max(E3y(i,:));
    xmin = E3x(i,I);
    xmax = max(E3x(i,:));
    C = [ones(3,1) E3x(i,:)' E3y(i,:)'];
    Ne = @(t) ([1, t, -t+1.2e-03]/(C))'*([1, t, -t+1.2e-03]/(C))*a_c*sqrt(2); %I've changed from (x,y) -> t(x,y)
    Ke = integral(Ne,xmin,xmax,'ArrayValued',true)';
    K = assem(edof_boundry3(i,:),K,Ke);
end


