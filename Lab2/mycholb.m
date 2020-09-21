
function G = mycholb(A)

n=size(A,1);
G = zeros(n,n);
G(1,1) = sqrt(A(1,1));

for j=2:n
    h = inv(transpose(G(1:j-1,1:j-1)))*A(1:j-1,j);
    G(1:j-1,j)=h;
    G(j,j) = sqrt(A(j,j) - transpose(h)*h);
end
end
