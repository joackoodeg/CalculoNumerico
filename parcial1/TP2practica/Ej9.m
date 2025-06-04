A = [1 -2 3 0; 3 -6 9 3; 2 1 4 1; 1 -2 2 -2];

[Ap, r] = doolittle_p(A);
Af = Ap(r,:);
L = tril(Af, -1) + eye(size(A));
U = triu(Af);

PA = A(r,:);
disp(PA - L * U);    % Debería ser casi igual a PA
