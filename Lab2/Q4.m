clc;
clear;

A = rand(3);
fprintf('\nFor A = \n');
disp(A)
fprintf('Determinant obtained by our function: %d\n',abs(mydet(A)))
fprintf('Determinant obtained by inbuilt function det(A): %d\n\n',abs(det(A)))

A1 = rand(5);

fprintf('For A = \n');
disp(A)
fprintf('Determinant obtained by our function: %d\n',abs(mydet(A1)))
fprintf('Determinant obtained by inbuilt function det(A): %d\n',abs(det(A1)))

function d = mydet(A)
[L U] = lu(A);
n = size(A,1);
d=1;
for i =1:n
   d=d*U(i,i);
end
end
