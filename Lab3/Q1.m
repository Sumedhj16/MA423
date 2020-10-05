N = 2:2:16 ;

[~,m] = size(N);
C = zeros(m);
%Condition number in 1-norm
for n = N
    H = hilb(n);
    C(n/2) = cond(H,1);
end
semilogy(N,C);
xlabel('n');
ylabel('Condition Number for 1-norm');
figure;
%Condition number in infinity-norm

for n = N
    H = hilb(n);
    C(n/2) = cond(H,inf);
end
semilogy(N,C);
xlabel('n');
ylabel('Condition Number for infinity norm');