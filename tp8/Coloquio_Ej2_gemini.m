clear all; clc;

% Parámetros del problema
g = 9.81;
l0 = 10;
l1 = 1;
w = 1;
phi = 0.02;

% Definición de l(t) y l'(t)
l = @(t) l0 + l1 * cos(w*t + phi);
dl_dt = @(t) -l1 * w * sin(w*t + phi);

% Definición de las funciones p(t), q(t), r(t)
p = @(t) -2 * dl_dt(t) ./ l(t);
q = @(t) -g ./ l(t);
r = @(t) 0 * t; % r(t) es cero

% Función f para la entrada del solver
f = @(t) [p(t), q(t), r(t)];

% Parámetros para el solver numérico
inter = [0, 5];       % Intervalo [a, b]
yc = [0.5, 0];        % Condiciones de contorno [y(a), y(b)]
L = 5000;             % Número de subintervalos (alto para mayor precisión)

% Resolver el problema de valor de contorno
[t, theta] = dif_fin_dir(f, inter, yc, L);

% --- Respuesta (a) ---
% Estimar la velocidad inicial theta'(0) usando una diferencia finita hacia adelante
h = t(2) - t(1);
theta_prime_0 = (theta(2) - theta(1)) / h;
fprintf('Respuesta (a):\n');
fprintf('La velocidad inicial necesaria es θ''(0) = %.3f rad/s\n\n', theta_prime_0);

% --- Respuesta (b) ---
% Encontrar la máxima amplitud del ángulo y cuándo ocurre
[max_abs_theta, idx] = max(abs(theta));
time_of_max = t(idx);
fprintf('Respuesta (b):\n');
fprintf('La máxima amplitud del ángulo es de %.4f rad, y ocurre a los %.4f segundos.\n\n', max_abs_theta, time_of_max);

% --- Respuesta (c) ---
% Encontrar el ángulo en t = 2.5 segundos usando interpolación lineal
theta_at_2_5 = interp1(t, theta, 2.5);
fprintf('Respuesta (c):\n');
fprintf('A los 2.5 segundos, el péndulo se encuentra formando un ángulo con la vertical de amplitud %.4f rad.\n', theta_at_2_5);
