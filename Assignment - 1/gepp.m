function [L, U, P] = gepp(A)

    % PA = LU solver. Uses 2/3n^3 + O(n^2) flops

    n = length(A);
    L = zeros(n);
    U = zeros(n);

    eps = 1e-8;

    % Initialize p
    p = zeros(n, 1);
    for i = 1:n
        p(i) = i;
    end

    for i = 1 : n

        k = i;

        % Determine index with highest absolute value
        for j = (i + 1) : n
            if abs(A(j, i)) > abs(A(k, i))
                k = j;
            end
        end

        % Swap in p, A and L

        pos = p(k); row = A(k, :); 
        p(k) = p(i); A(k, :) = A(i, :);
        p(i) = pos; A(i, :) = row;

        lrow = L(k, :); 
        L(k, :) = L(i, :);
        L(i, :) = lrow;
            
        L(i, i) = 1;
        
        % If zero pivot encountered, exit with error

        if (abs(A(i, i)) < eps)
            error('Zero pivot encountered')
        end

        for j = (i+1) : n
            mij = A(j, i)/A(i, i); % Compute multiplier to use in this step
            L(j, i) = mij; % Update L with multiplier value
            A(j, :) = A(j, :) - mij * A(i, :); % Use vector operations to update jth row of A
        end
    end

    U = A; % The final matrix is upper triangular and U with LU = A
    P = zeros(n, n);

    % Finally produce the permutation matrix from the permutation p

    for i = 1:n
        P(i, p(i)) = 1;
    end


end

% > A = randn(4)
% A =

%    0.944928  -1.127877   0.079597   2.292279
%    0.265847  -0.679432   0.478499   1.957681
%    1.450122   0.483774   0.084693   0.088295
%   -2.096448  -1.289996   0.559492  -0.030096

% > [L, U, P] = gepp(A)
% L =

%    1.00000   0.00000   0.00000   0.00000
%   -0.45073   1.00000   0.00000   0.00000
%   -0.69170   0.23900   1.00000   0.00000
%   -0.12681   0.49319   0.98322   1.00000

% U =
%   -2.09645  -1.29000   0.55949  -0.03010
%    0.00000  -1.70932   0.33178   2.27871
%    0.00000   0.00000   0.39240  -0.47713
%    0.00000   0.00000   0.00000   1.29915

% P =

%    0   0   0   1
%    1   0   0   0
%    0   0   1   0
%    0   1   0   0

% > P*A - L*U
% ans =

%    0.0000e+00   0.0000e+00   0.0000e+00   0.0000e+00
%    0.0000e+00   0.0000e+00   1.3878e-17   0.0000e+00
%    0.0000e+00   0.0000e+00   1.3878e-17  -2.7756e-17
%    0.0000e+00   0.0000e+00  -5.5511e-17   0.0000e+00
