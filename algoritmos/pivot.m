% Con pivoteo
    [Ap, r_indices] = doolittle_p(A);
		PA = A(r_indices, :);
		Af = Ap(r_indices, :);  % <- Esta línea es necesaria

		L = tril(Af, -1) + eye(size(A));
		U = triu(Af);

		bp = b(r_indices);

		y = sust_adelante(L, bp);
		x = sust_atras(U, y);
		r = b - A * x;
