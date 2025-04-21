% Script para ejercicio 8 b)

% Definimos las matrices
A1 = [8 4 1; 2 6 2; 2 4 8];
A2 = [5.00e-02 5.57e+02 -4.00e-02; 1.98e+00 1.94e+02 -3.00e-03; 2.74e+02 3.11e+00 7.50e-02];
A3 = [1 2 -1; 2 4 0; 0 1 -1];

b = [1; 2; 3];

% Funciones necesarias (se deben tener previamente: doolittle.m, doolittle_p.m, sust_adelante.m, sust_atras.m)

matrices = {A1, A2, A3};
names = {"A1", "A2", "A3"};

for i = 1:3
    A = matrices{i};
    printf("----- %s -----\n", names{i});

    % Sin pivoteo
    Af = doolittle(A); % devuelve LU sobre A
    [L, U]= lu(Af);
    %L = tril(Af, -1) + eye(size(A)); % L tiene unos en diagonal
    %U = triu(Af);

    y = sust_adelante(L, b);
    x = sust_atras(U, y);
    r = b - A * x;

    printf("Sin pivoteo:\n");
    disp("x = "), disp(x)
    disp("Residuo r = "), disp(r)
    disp("Norma del residuo = "), disp(norm(r))

    % Con pivoteo
    [Ap, r_indices] = doolittle_p(A);
    PA = A(r_indices, :);
    Af = Ap(r_indices, :);  % <- Esta línea es necesaria
    % Construye la matriz permutada PA, es decir, reordena las filas de A de acuerdo al pivoteo hecho por doolittle_p

    L = tril(Af, -1) + eye(size(A));
    U = triu(Af);

    bp = b(r_indices);
    % Permuta el vector del lado derecho b con el mismo orden que se usó en las filas de A. Esto asegura que estés resolviendo el sistema
    % PA . x = P . b

    y = sust_adelante(L, bp); % L.y = bp
    x = sust_atras(U, y); % U.x = y
    r = b - A * x;

    printf("Con pivoteo:\n");
    disp("x = "), disp(x)
    disp("Residuo r = "), disp(r)
    disp("Norma del residuo = "), disp(norm(r))
    printf("\n");
end

