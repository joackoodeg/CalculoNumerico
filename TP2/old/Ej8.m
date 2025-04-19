% Definir las matrices del ejercicio
A1 = [8 4 1; 2 6 2; 2 4 8];
A2 = [5.00e-02 5.57e+02 -4.00e-02;
      1.98e+00 1.94e+02 -3.00e-03;
      2.74e+02 3.11e+00 7.50e-02];
A3 = [1 2 -1; 2 4 0; 0 1 -1];

% Vector de términos independientes
b = [1; 2; 3];

% Listas para recorrer
matrices = {A1, A2, A3};
nombres = {'A1', 'A2', 'A3'};

for i = 1:3
    A = matrices{i};
    fprintf('\n====================\n');
    fprintf('Probando matriz %s\n', nombres{i});

    %% ---------------------- Sin pivoteo ----------------------
    fprintf('\n> Doolittle sin pivoteo:\n');
    Af = doolittle(A);  % Matriz factorizada
    n = size(Af, 1);

    % Construir L y U manualmente
    [L, U] = extraer_LU(Af);

    % Sustituciones
    y = sust_adelante(L, b);
    x = sust_atras(U, y);

    % Calcular residuo
    residuo = A * x - b;
    fprintf('Solución x:\n');
    disp(x);
    fprintf('Residuo:\n');
    disp(residuo);

    %% ---------------------- Con pivoteo ----------------------
    fprintf('\n> Doolittle con pivoteo:\n');
    [Ap, r] = doolittle_p(A);
    PA = A(r, :);   % Matriz permutada
    bp = b(r);      % Vector b permutado

    % Construir L y U manualmente
    [L, U] = extraer_LU(Ap);

    % Sustituciones
    y = sust_adelante(L, bp);
    x = sust_atras(U, y);

    % Calcular residuo
    residuo = A * x - b;
    fprintf('Solución x:\n');
    disp(x);
    fprintf('Residuo:\n');
    disp(residuo);
end
