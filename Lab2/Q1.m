clc;
clear all;
%%%part a%%% 
A = [10^(-20) 1;1 1];
[L,U] = genp(A);

A_LU = A - L*U
%%part-b%%%%

b = [1;0];
x_fwd = rowforward(L,b);
x_bwd = colbackward(U,b);


%%rowforward
function x = rowforward(L,b)
    d = size(L);
    n = d(1);
    x = zeros(n,1);
    for i = 1:n
        for j = 1:i-1
              b(i) = b(i) - L(i,j)*x(j);
        end
        x(i) = b(i)/L(i,i);
    
    end
end

%%colbackward
function x = colbackward(U, b)
    n = size(U,1);
    x = zeros(n,1);
    for j = flip([1:n])
        x(j) = b(j)/U(j,j);
        b(1:(j-1)) = b(1:(j-1)) - U(1:(j-1), j)*x(j);
    end
end