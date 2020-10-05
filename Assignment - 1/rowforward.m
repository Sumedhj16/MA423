function x = rowforward(L, b)

	% Solve Lx =  b 

	eps = 1e-7;

    n = length(L);
    x = zeros(n, 1);
    
    for i = 1:n
        val = b(i);
        for j = 1:(i - 1)
            val = val - x(j) * L(i, j); % Solve x_1*U_{i, 1} + x_2*U_{i, 2} + \ldots + x_i*U_{i, i} = b_i for x_i * U_{i, i} = val
        end

        if (abs(L(i, i)) < eps)
        	error('L is singular')
        end

        x(i) = val / L(i, i); % Solve for x_i
    end
end