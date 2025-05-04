n = 1000;
tol = 1e-5;
maxit= 10000;

i = (1:n)';

A = diag(2*i);

A = A + diag(0.5 * ones(n-2, 1), -2);
A = A + diag(0.25 * ones(n-4, 1), -4);

b = i -pi;

x0 = zeros(n,1);

tic;
[x_jacobi, rj, it_jacobi] = jacobi(A, b, x0, maxit, tol);
t_jacobi = toc;
fprintf("Jacobi: %d iteraciones, tiempo: %.4f s\n", it_jacobi, t_jacobi);
disp(norm(A*x_jacobi - b));

