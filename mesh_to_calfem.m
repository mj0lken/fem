% Converts mesh output to Calfem format

nelm=length(t(1,:)); %Counts the number of triangles. Which is nelm
edof(:,1)=1:nelm; % element 1-174, first column of edof
edof(:,2:4)=t(1:3,:)'; % 2-4 column of edof is the same as row 1-3 in t
coord=p'; % Coord = all the points and their coordinates
ndof=max(max(t(1:3,:))) ; % max(t(1:3,:)) gives max values in row 1-3 
%and second max gives total max (Number of nodes)
[Ex,Ey]=coordxtr(edof,coord,(1:ndof)',3); 