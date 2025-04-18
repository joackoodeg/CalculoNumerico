n = 1000;
i = (1:n)';

main_diag = 2 * i;
diag2 = 0.5 * i(1:end-2);
diag4 = 0.25 * i(1:end-4);

A = diag(main_diag) + ...
    diag(diag2, 2) + diag(diag2, -2) + ...
    diag(diag4, 4) + diag(diag4, -4);

b = pi * ones(n, 1);

x0 = zeros(n, 1);
maxit = 1000;
tol = 1e-5;

% ------------------------------
% Método SOR
% ------------------------------
for w=1.0: 0.1 :1.9
  [x_sor, rsor, it_sor] = sor(A, b, x0, maxit, tol, w);
  printf("w= %.1f, it= %f\n", w, it_sor);
end;

