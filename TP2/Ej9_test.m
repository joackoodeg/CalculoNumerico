A = [1 -2 3 0; 3 -6 9 3; 2 1 4 1; 1 -2 2 -2];
[Ap, r] = doolittle_p(A);
L = tril(Ap, -1) + eye(size(A));
U = triu(Ap);
PA = A(r,:);
disp(PA);
disp(L * U);    % Debería ser casi igual a PA

