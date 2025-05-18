format long;

A = [2 1 0 -2 1; 2 2 1 2 -1; -2 -2 2 1 0; -1 1 1 2 1; -2 2 -2 0 3];
b = [2; 0; 6; 7; 3];

%%% a
x = gauss_elim(A, b);

printf("x1= %.3f\n", x(1));
printf("x2= %.3f\n", x(2));
printf("x3= %.3f\n", x(3));
printf("x4= %.3f\n", x(4));
printf("x5= %.3f\n", x(5));

%%% b
tol = 1e-4;
x0 = zeros(5,1);
maxit = 1000000;

[x_j, r_j, it_j] = jacobi(A, b, x0, maxit, tol);
printf("it jacobi= %d\n", it_j);

% comento porque no converge
%[x_gs, r_gs, it_gs] = gaussseidel(A, b, x0, maxit, tol);
%printf("it gauss seidel= %d\n", it_gs);

%% c

e = norm((x-x_j),inf)/norm((x),inf);
printf("error= %.10f", e);

