A = [0.5 -1 0; -1 3 -1; 0 -1 2];
b = [7; 4; 5];
tol = 1e-8;
maxit = 10000;

for w = 1:0.1:2
  %[x_sor, r_sor, it_sor] = sor(A, b, b, maxit, tol, w);
  %printf("w = %.1f, iteraciones = %d\n", w, it_sor);
  % w = 1.5, iteraciones = 30
  endfor

%[x_ja, r_ja, it_ja]=jacobi(A, b, b, maxit, tol);
%disp(x_ja);
% -> Converge

[x, r, it] = gaussseidel(A, b, b, maxit, tol);

disp(it);
