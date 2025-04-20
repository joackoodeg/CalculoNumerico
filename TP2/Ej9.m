% Ejercicio 9 - Factorización de Doolittle con pivoteo parcial (vectorizado)

% Matriz del ejercicio
A_original = [1 -2 3 0;
              3 -6 9 3;
              2  1 4 1;
              1 -2 2 -2];

disp("Matriz Original:");
disp(A_original);

[A_fact, r] = doolittle_p(A_original);
n = size(A_fact, 1);

% Construir PA usando el vector de permutación r
PA = A_original(r, :);

% Extraer L y U correctamente desde A_fact(r, :)
Af = A_fact(r, :);  % A_fact reordenada según r
L = tril(Af, -1) + eye(n);  % Parte inferior + identidad
U = triu(Af);               % Parte superior

% Matriz de permutación P (opcional, solo para visualizar)
P = eye(n)(r, :);

% Mostrar resultados
disp("Matriz factorizada:");
disp(A_fact);

disp("Matriz de permutación P:");
disp(P);

disp("Matriz L:");
disp(L);

disp("Matriz U:");
disp(U);

disp("PA:");
disp(PA);

disp("L*U:");
disp(L * U);

disp("Diferencia (PA - L*U):");
disp(PA - L * U);  % Ahora sí debe dar casi ceros

