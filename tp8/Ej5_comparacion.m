% Ejercicio 5 - Comparación de métodos
% Ecuación: -u'' = f(x), u(0)=21, u'(3)=0 (extremo aislado)

% Fuente
f = @(x) [zeros(size(x)), zeros(size(x)), 20 .* sin(5*(x - 1))];  % p=0, q=0, r=f(x)

% Intervalo
a = 0;
b = 3;
L = 100;

% Condiciones de contorno
alpha = 21;        % u(0) = 21
beta = 12.17;      % Valor obtenido desde Neumann (solo para comparar)
rob = [1 0 0];      % Neumann: u'(b) = 0

%% Método 1: Diferencias Finitas con Neumann
[x1, y1] = dif_fin_rob(f, [a b], alpha, rob, L);

%% Método 2: Disparo Lineal
[x2, y2] = disparo_lineal(f, [a b], [alpha beta], L);

%% Método 3: Diferencias Finitas con Dirichlet (usamos beta ≈ y1(end))
[x3, y3] = dif_fin_dir(f, [a b], [alpha y1(end)], L);

%% Graficar todas las soluciones
figure;
plot(x1, y1, 'bo-', 'DisplayName', 'Neumann (dif\_fin\_rob)');
hold on;
plot(x2, y2, 'r--', 'DisplayName', 'Disparo Lineal');
plot(x3, y3, 'g-.', 'DisplayName', 'Dirichlet (dif\_fin\_dir)');
xlabel('x');
ylabel('Temperatura');
title('Comparación de métodos - Temperatura en la barra');
legend('show');
grid on;

%% Comparación de temperaturas en x = 3
fprintf('\nTemperaturas en el extremo derecho (x = 3):\n');
fprintf('  Neumann (dif_fin_rob):     %.2f\n', y1(end));
fprintf('  Disparo Lineal:            %.2f\n', y2(end));
fprintf('  Dirichlet (dif_fin_dir):   %.2f\n', y3(end));

%% Temperatura máxima
[val1, idx1] = max(y1);
[val2, idx2] = max(y2);
[val3, idx3] = max(y3);

fprintf('\nTemperatura máxima:\n');
fprintf('  Neumann:   %.2f en x = %.2f\n', val1, x1(idx1));
fprintf('  Disparo:   %.2f en x = %.2f\n', val2, x2(idx2));
fprintf('  Dirichlet: %.2f en x = %.2f\n', val3, x3(idx3));

