% Resolver el sistema del ejercicio 7
% Usando la función de eliminación de Gauss separada

% Definir el tamaño del sistema
N = 100;

% Crear la matriz del sistema
A = zeros(N, N);
b = zeros(N, 1);

% Primera ecuación: x_1 = 0
A(1, 1) = 1;
b(1) = 0;

% Última ecuación: x_N = 0
A(N, N) = 1;
b(N) = 0;

% Ecuaciones intermedias: -x_{i-1} + 2x_i - x_{i+1} = 1/N^2
for i = 2:N-1
    A(i, i-1) = -1;
    A(i, i) = 2;
    A(i, i+1) = -1;
    b(i) = 1/(N^2);
end

% Resolver el sistema usando la función de eliminación de Gauss
x = gauss_elim(A, b);

% Graficar la solución
t = linspace(0, 1, N);
figure;
plot(t, x, 'b-', 'LineWidth', 1.5);
grid on;
xlabel('t');
ylabel('x(t)');
title('Solución del sistema: x(t)');

% Mostrar el valor máximo y su posición
[max_val, max_idx] = max(x);
fprintf('Valor máximo de x(t): %.6f en t = %.6f\n', max_val, t(max_idx));
