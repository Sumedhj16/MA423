clc;
clear;

%%Example 1%%
a=2;
b=6;
n=3;
r = a + (b-a).*rand(n,1);
D = diag(r);
fprintf('\nFor a =2, b=6, n=3 \n');
fprintf('Answer by our functin mycholb: \n')
disp(mycholb(D));
fprintf('Answer by the inbuilt functin chol: \n');
disp(chol(D));

%%Example 2%%
a=5;
b=7;
n=4;
r = a + (b-a).*rand(n,1);
D = diag(r);

fprintf('\nFor a =5, b=7, n=4 \n');
fprintf('Answer by our functin mycholb: \n')
disp(mycholb(D));
fprintf('Answer by the inbuilt functin chol: \n');
disp(chol(D));
