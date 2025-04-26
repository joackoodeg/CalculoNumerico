% Dimensión del sistema
n = 40;

% Construcción de la matriz A
A = 2 * eye(n);                  % Diagonal principal con 2
A += -1 * diag(ones(n-1,1), 1);  % Diagonal superior con -1
A += -1 * diag(ones(n-1,1), -1); % Diagonal inferior con -1

% Construcción del vector b
b = (1.5 * (1:n)' - 6);  % Vector columna

x = gauss_elim(A,b);

% a)
disp("Valor de x(20) por eliminacion de Gauss");
disp(x(20));

tol= 1e-5;
maxit = 10000;
x0 = zeros(n, 1);

[x_j, r_j, it_j]=jacobi(A, b, x0, maxit, tol)

disp("Iteraciones Jacobi")
disp(it_j);

[x_gs, r_gs, it_gs]=gaussseidel(A,b,x0,maxit,tol);

disp("Iteracioes Gauss Seidel");
disp(it_gs);

w = 1.85;
[x_sor, r_sor, it_sor] = sor(A,b,x0,maxit,tol,w);

disp("Iteracioes SOR");
disp(it_sor);

%% El criterio de convergencia es aplicado dentro de los metodos
%    r(it+1) = norm(x - x0, inf) / norm(x, inf);  % error relativo infinito
%    if r(it+1) < tol
%      break;
%    endif

