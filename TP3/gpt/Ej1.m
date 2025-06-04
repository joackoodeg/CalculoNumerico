% Sistema de prueba bien condicionado
A = [4, -1, 0;
     -1, 4, -1;
     0, -1, 4];
b = [3; 6; 3];
x0 = zeros(3, 1); % Aproximación inicial
maxit = 100;      % Número máximo de iteraciones
tol = 1e-6;       % Tolerancia para convergencia

% Llamada a la función
[x, it, r_h] = jacobi(A, b, x0, maxit, tol);

% Mostrar resultados
disp('Solución aproximada:');
disp(x);
disp(['Número de iteraciones: ', num2str(it)]);
disp('Historial de residuos:');
disp(r_h);

% Verificar la solución
disp('Residuo del sistema:');
disp(norm(A*x - b));

% Comparar con la solución exacta
x_exacta = A\b;
disp('Solución exacta:');
disp(x_exacta);
disp(['Error respecto a solución exacta: ', num2str(norm(x - x_exacta, inf))]);
