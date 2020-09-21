clc;
Wilkinson(5)

function Ans = Wilkinson(n)
A = ones(n)*-1;
B = eye(n);
C = tril(A);
Ans = C + 2*B;
Ans(:,n)= 1;
end

