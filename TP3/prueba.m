% Programa para probar la función Jacobi

% Definir matrices de prueba
A1 = [10, 5, 0, 0;
      5, 10, -4, 0;
      0, -4, 8, -1;
      0, 0, -1, 5];
b1 = [6; 25; -11; -11];

A2 = [3, 1, 1;
      1, 3, -1;
      3, 1, -5];
b2 = [5; 3; -1];

% Configuración para las pruebas
x0 = zeros(size(b1));
maxit = 100;
tol = 1e-6;
w=1;

% Llamar a la función Jacobi
[x, r, it] = gaussseidel(A1, b1, x0, maxit, tol);

% Mostrar resultados
disp('Solución obtenida:');
disp(x);
disp(['Número de iteraciones: ', num2str(it)]);
disp(['Residuo final: ', num2str(r(end))]);

% Verificar solución
disp('Verificación (Ax - b):');
disp(A1*x - b1);
