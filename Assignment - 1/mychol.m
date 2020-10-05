function R = mychol(A)

    [~,n] = size(A);

    eps = 1e-6; 
    % first check if the matrix is not symmetric

    for i = 1:n
        for j = 1:n
            if abs(A(i, j) - A(j, i)) > eps
                error('Matrix is not symmetric')
            end
        end
    end
    % if so exit with error

    
    R = zeros(n);
    if A(1,1) <= 0
    % check if not positive definite

        error('Matrix is not positive definite');
    % if so exit with error

    else
        %compute parameters described in the algorithm

        R(1,1) = (A(1,1))^(0.5);
        if n >= 2
            b = A(2:n,1);
            r = b/R(1,1);
            R_hat = mychol(A(2:n,2:n)-r*r');
            R(1,2:n) = r';
            R(2:n,2:n) = R_hat;
        end
    end

end

% A = rand(4)
% 
% A =
% 
%     0.0089    0.1521    0.7841    0.0818
%     0.9960    0.4796    0.1704    0.8529
%     0.2752    0.8888    0.7313    0.6866
%     0.0335    0.2834    0.2466    0.9581
% 
% G = mychol(A*A')
% 
% G =
% 
%     0.8030    0.3552    0.9555    0.3925
%          0    1.3610    0.7870    0.6532
%          0         0    0.5827    0.3606
%          0         0         0    0.5911
% 
% norm(G'*G - A*A')
% 
% ans =
% 
%    1.1102e-16

