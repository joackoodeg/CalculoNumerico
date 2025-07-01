clear; clc; format long;

% -- PARTE 1: DEFINICIÓN DEL PROBLEMA --

% Ecuación: y'' = p(x)y' + q(x)y + r(x)
% Reescribimos la ecuación original x^2*y'' + (11/3)*x*y' - y + log(x) - 8/3 = 0
% en la forma estándar: y'' = -(11/(3*x))*y' + (1/x^2)*y + (8/3 - log(x))/x^2

p = @(x) -(11/3) ./ x;
q = @(x) 1 ./ (x.^2);
r = @(x) (8/3 - log(x)) ./ (x.^2);

% Juntamos las funciones para el solver
f = @(x) [p(x), q(x), r(x)];

% Intervalo y condiciones de contorno
inter = [1, 4];
yc = [1, 2.9736954];

% Parámetros de la discretización
h = 0.0001; % Usamos un h más pequeño para mayor exactitud
L = (inter(2) - inter(1)) / h;

% -- PARTE 2: RESOLUCIÓN NUMÉRICA --

% Llamada a la función de diferencias finitas
[x, y] = dif_fin_dir(f, inter, yc, L);

% -- PARTE 3: CÁLCULO DE LAS SOLICITUDES --

fprintf('--- RESPUESTAS ---\n\n');

%% a) Calcular y(2.5)
% Buscamos el índice exacto donde x = 2.5
idx_2_5 = round((2.5 - inter(1))/h) + 1;
y_2_5 = y(idx_2_5);
fprintf('a) y(2.5) = %.7f\n', y_2_5);

%% b) Estimar y'(2.5)
% Usamos la fórmula de diferencia central (más precisa)
% y'(x_i) ≈ (y(i+1) - y(i-1)) / (2*h)
deriv_2_5 = (y(idx_2_5 + 1) - y(idx_2_5 - 1)) / (2*h);
fprintf('b) y''(2.5) = %.5f\n', deriv_2_5);

%% c) Estimar la integral de y(x) de 1 a 4
% Usamos la regla del trapecio compuesta (función trapz de MATLAB)
integral_y = trapz(x, y);
fprintf('c) La integral de y(x) es = %.7f\n', integral_y);

