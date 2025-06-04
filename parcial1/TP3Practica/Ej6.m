A = [3 1 1; 1 3 -1;  3 1 -5];
b = [5; 3; -1];
x0 = zeros(3,1);
maxit =10000;
tol = 1e-6;

[x, r, it] = gaussseidel(A, b, x0, maxit, tol)

disp(x);
