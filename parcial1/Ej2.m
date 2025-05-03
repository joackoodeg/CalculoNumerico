clc;
A =[1 2 -2 -1 0; -1 3 -1 -1 -2; 0 -2 3 2 0; -1 0 -1 2 -1; 2 0 -2 -1 3];
b = [1; -2; 5; 5; -1];

%%% A

x = gauss_elim(A,b);

printf("X= %.5f", x);


%%% B
maxit = 10000;
tol = 1e-4;
x0 = zeros(length(b), 1);

[x_j, r_j, it_j]=jacobi(A, b, x0, maxit, tol);

disp("jacobi it: ");
disp(it_j);

[x_g, r_g , it_g] = gaussseidel(A, b, x0, maxit, tol);

disp("gausseidel it:  (no converge)");
disp(it_g);

e = norm((x-x_j),inf)/norm((x),inf);

printf("error = %.10f", e);
