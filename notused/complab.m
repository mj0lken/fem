%% Computer exercise 1 

A = 10;
k = 5;
nbr_of_elements = 100;
Le = 6/nbr_of_elements;

Ke = (50/Le)*[1 -1;-1 1];

bc = [1 0];

fe = 50*Le*[1;1];

K = zeros(nbr_of_elements+1);
f = zeros(nbr_of_elements+1,1);

edof = zeros(nbr_of_elements,3);


for i = 1:nbr_of_elements
    edof(i,1) = i;
    edof(i,2) = i;
    edof(i,3) = i+1;
end 

f(end) = f(end)-150; 

[K,f] = assem(edof,K,Ke,f,fe);
[a,Q] = solve(K,f,bc);

x = linspace(2,8,nbr_of_elements+1);

plot(x,a);

%% Computer exercise 2
clear all
clc
geom2;


eq = 0;
ep = 1;

D = eye(2);
K = zeros(ndof);
f = zeros(ndof,1);

[nie,n]=size(edof);
t=edof(:,2:n);

for i = 1:nelm
    [Ke, fe] = flw2te(ex(i,:),ey(i,:),ep,D,eq);
    K(t(i,:),t(i,:)) = K(t(i,:),t(i,:))+Ke;
    f(t(i,:))=f(t(i,:))+fe;
end

[a, Q] = solve(K,f,bc);

