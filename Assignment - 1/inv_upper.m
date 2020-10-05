function X = inv_upper (U, A)
	
	% Solves UX = A for U upper triangular.
	% n^3 + O(n^2) flops

	n = length(U);
	X = zeros(n, n);

	for i = 1:n % for each column
		b = A(:, i);

		X(:, i) = colbackward(U, b);
	end
end 
