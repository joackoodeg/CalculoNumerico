% Script principal para resolver el problema usando tu gaussseidel.m

% Paso 1: Construcción del sistema lineal
N = 41;
h = 1 / (N - 1);
x_full = linspace(0, 1, N);
f = @(x) 20 * exp(-10 * (x - 0.7).^2);

A = zeros(N-2, N-2); % 39x39
b = zeros(N-2, 1);

for j = 1:N-2
  if j > 1
    A(j, j-1) = -1;
  end
  A(j, j) = 2;
  if j < N-2
    A(j, j+1) = -1;
  end
  xj = x_full(j+1); % x1 a x39
  b(j) = h^2 * f(xj);
end

% Agregar condiciones de frontera
b(1) += 5;   % u(0)
b(end) += 6; % u(1)

% Paso 2: Condiciones iniciales para Gauss-Seidel
x0 = zeros(N-2, 1);
maxit = 10000;
tol = 1e-6;

% Paso 3: Llamar a tu función de Gauss-Seidel
[x_sol, r, it] = gaussseidel(A, b, x0, maxit, tol);

% Paso 4: Mostrar resultados
fprintf('Iteraciones realizadas: %d\n', it);
fprintf('Error final: %.2e\n', r(end));

% Paso 5: Construir solución completa incluyendo condiciones de frontera
U_full = [5; x_sol; 6]; % u(0) = 5, u(1) = 6

T_medio = U_full(21); % 21 porque Octave indexa desde 1
fprintf('Temperatura en el punto medio (x = 0.5): %.6f\n', T_medio);

% Graficar
plot(x_full, U_full, 'o-');
xlabel('x');
ylabel('u(x)');
title('Solución aproximada usando Gauss-Seidel');
grid on;

% Eror absoluto norma infinito
% r(it+1) = norm( x-x0, inf);

