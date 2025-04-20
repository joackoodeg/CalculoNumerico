% Parte A

N = 100;
h = 1 / N^2;

% Construcción de la matriz A
A = 2 * eye(N);
for i = 2:N-1
    A(i, i-1) = -1;
    A(i, i+1) = -1;
end
A(1, :) = 0; A(1,1) = 1;
A(N, :) = 0; A(N,N) = 1;

% Vector b
b = h * ones(N, 1);
b(1) = 0;
b(N) = 0;

% Factorización LU
[L, U] = lu(A);  % sin pivoteo porque A es s.d.p y tridiagonal

% Resolución
y = L \ b;
x = U \ y;

% Resultado
disp("Máximo de la solución x:");
disp(max(x));


% Parte b - Probar para distintos k=1..10k=1..10 y guardar máximos

N = 100;
x_maximos = zeros(10, 1);

A = 2 * eye(N);
for i = 2:N-1
    A(i, i-1) = -1;
    A(i, i+1) = -1;
end
A(1, :) = 0; A(1,1) = 1;
A(N, :) = 0; A(N,N) = 1;

[L, U] = lu(A);  % ya sirve para todos los k

for k = 1:10
    b = (1 / N^k) * ones(N, 1);
    b(1) = 0;
    b(N) = 0;

    y = L \ b;
    x = U \ y;

    x_maximos(k) = max(x);
end

disp("Valores máximos de x para cada k:");
disp(x_maximos);

% Parte C - Grafica

k = 1:10;
semilogy(k, x_maximos, '-o', 'LineWidth', 2);
xlabel('k');
ylabel('Máximo valor de x');
title('Valor máximo de la solución vs k');
grid on;


