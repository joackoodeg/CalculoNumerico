% Definir la matriz del ejercicio 1
A = [3/4, 1/6; 1/4, 1/4];

% Extraer las matrices L, D y U usando la función extraer_jacobi
[L, D, U] = extraer_jacobi(A);

% Mostrar las matrices extraídas
disp('Matriz A:');
disp(A);
disp('Matriz L (triangular inferior estricta):');
disp(L);
disp('Matriz D (diagonal):');
disp(D);
disp('Matriz U (triangular superior estricta):');
disp(U);
disp('Verificación: A = L + D + U');
disp(L + D + U);
