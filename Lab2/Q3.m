clc;
clear;

%%%Example - 1%%%
A = randn(4);
b= randn(4,1);
[L, U, P] = gepp(A);

y=P*b;
y=inv(L)*y;
example1=inv(U)*y

example1a=A\b

%%%Example - 2%%%

A = randn(7);
b= randn(7,1);
[L, U, P] = gepp(A);

y=P*b;
y=inv(L)*y;
example2=inv(U)*y

example2a=A\b


%%%Example - 3%%%

A = randn(20);
b= randn(20,1);
[L, U, P] = gepp(A);

y=P*b;
y=inv(L)*y;
example3=inv(U)*y

example3a=A\b
