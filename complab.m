%% Computer exercise 1 

A = 10;
k = 5;
nbr_of_elements = 3;

Ke = 50/4*[1 -1;-1 1];

fe = [100;100];

K = zeros(nbr_of_elements+1);
f = zeros(nbr_of_elements+1,1);

edof = zeros(nbr_of_elements+1,3);


for i = 1:nbr_of_elements
    edof(i,1) = i;
    edof(i,2) = i;
    edof(i,3) = i+1;
end 


[K,f] = assem(edof,K,Ke,f,fe)