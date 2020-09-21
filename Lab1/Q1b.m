clc;
n=3;
hamilton(n)

function H = hamilton(n)

H11 = rand(n);
H21 = diag(rand(1,n));
H12 = diag(rand(1,n));
H22 = -1*(H11.');

H = [H11 H12; H21 H22];
end