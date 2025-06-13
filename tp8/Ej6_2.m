% Parámetros físicos
K0 = 0.9;
H = 15;
uE = 4;

% Dominio y discretización
inter = [0, 5];
ycd = 6;
h = 0.001;
L = round((inter(2) - inter(1))/h);

% Funciones
cR = @(x) 1.05 * x + 2;
f_fuente = @(x) 5 * x .* (5 - x);
f = @(x) [0.*x, cR(x)/K0, f_fuente(x)/K0];

% Condición Robin tal como tu función espera
rob = [-K0, -H, -H*uE];

% Resolución
[x, y] = dif_fin_rob(f, inter, ycd, rob, L);

% Gráfica
plot(x, y, 'r-', 'LineWidth', 2);
xlabel('x'); ylabel('u(x)');
title('Distribución de temperatura en la barra (Ejercicio 6)');
grid on;

% Evaluación en x = 2.5 cm
[~, idx] = min(abs(x - 2.5));
fprintf("Temperatura en x = 2.5 cm: %.4f °C\n", y(idx));

% Temperatura máxima
[max_val, idx_max] = max(y);
fprintf("Temperatura máxima: %.4f °C en x = %.2f cm\n", max_val, x(idx_max));

