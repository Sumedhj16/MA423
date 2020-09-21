clc;
clear;

a=2
b=6
n=3
r = a + (b-a).*rand(n,1)
D = diag(r)
mycholb(D)
chol(D)

B = randn(n); [Q,R] = qr(B);
Q*R
