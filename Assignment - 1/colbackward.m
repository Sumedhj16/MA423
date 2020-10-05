function x = colbackward(U, b)

	% Solve Ux = b.

	eps = 1e-7;

    n = length(U); 
    x = zeros(n, 1);
    for i = n:-1:1
        val = b(i);
        for j = (i + 1):n
            val -= U(i, j) * x(j); % Solve x_i * U_{i,i} + x_{i+1} * U_{i,i+1} + ... + x_n * U_{i, n} = b_i for x_i * U_{i, i} = val
        end
        
        if (abs(U(i,i)) < eps)
        	error('U is singular');
        end

        x(i) = val / U(i, i); % Compute x_i
    end
end