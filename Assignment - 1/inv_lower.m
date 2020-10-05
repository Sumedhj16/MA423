function X = inv_lower (L, A)

	% Solves LX = A for L lower triangular
	% n^3 + O(n^2) flops (because n * n^2)
	
	n = length(L);
	X = zeros(n, n);

	for i = 1:n % for each column
		b = A(:, i);

		X(:, i) = rowforward(L, b);
	end
end 
