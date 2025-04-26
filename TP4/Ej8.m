% Ejercicio 8 - Análisis de la energía térmica de un dispositivo
% E(t) = ((t + 1/3)^3 + 1/3)e^(-t)

% Definimos la función de energía
E = @(t) ((t + 1/3).^3 + 1/3) .* exp(-t);

% Definimos la derivada primera (calculada analíticamente)
dE = @(t) exp(-t) .* (3*(t + 1/3).^2 - ((t + 1/3).^3 + 1/3));

% Definimos la derivada segunda (calculada analíticamente)
d2E = @(t) exp(-t) .* (6*(t + 1/3) - 3*(t + 1/3).^2 - (3*(t + 1/3).^2 - ((t + 1/3).^3 + 1/3)));

% Configuración para todos los métodos
kmax = 100;
tol = 1e-5;  % 5 dígitos de precisión

% -----------------------------------------------------------------
% a) Determinar los instantes donde E(t) = 1.5
% -----------------------------------------------------------------

% Definimos la función para encontrar donde E(t) = 1.5
f = @(t) E(t) - 1.5;
df = @(t) dE(t);

% Primero exploramos gráficamente para identificar número de soluciones
t_range = linspace(0, 6, 1000);
E_values = E(t_range);

figure(1);
plot(t_range, E_values, 'b-', 'LineWidth', 2);
grid on;
hold on;
plot(t_range, 1.5*ones(size(t_range)), 'r--', 'LineWidth', 1.5);
xlabel('Tiempo (t)');
ylabel('Energía E(t)');
title('Energía térmica del dispositivo');
legend('E(t)', 'E = 1.5');

% La observación gráfica muestra que hay dos intersecciones con E = 1.5
% Aplicaremos bisección para encontrar los intervalos aproximados,
% seguido de Newton para refinar las soluciones

% Primera raíz - aproximadamente entre 0 y 1
[t1_bis, h1_bis] = biseccion(f, 0, 1, kmax, 1e-2);
[t1, h1] = newton(f, df, t1_bis, kmax, tol);

% Segunda raíz - aproximadamente entre 1 y 3
[t2_bis, h2_bis] = biseccion(f, 1, 3, kmax, 1e-2);
[t2, h2] = newton(f, df, t2_bis, kmax, tol);

fprintf('\na) Instantes donde E(t) = 1.5:\n');
fprintf('   t1 = %.5f (Iteraciones Newton: %d)\n', t1, length(h1)-1);
fprintf('   t2 = %.5f (Iteraciones Newton: %d)\n', t2, length(h2)-1);

% Marcamos los puntos en la gráfica
plot([t1, t2], [1.5, 1.5], 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'g');

% -----------------------------------------------------------------
% b) Determinar la máxima energía y cuándo ocurre
% -----------------------------------------------------------------

% Para el máximo de E(t), buscamos dE(t) = 0
% Observando la gráfica, parece que ocurre cerca de t = 0
% Aplicamos Newton para encontrar el máximo

% La derivada debería cambiar de signo cerca del máximo
t_max_guess = 0.5;  % Comenzamos con una estimación

[t_max, h_max] = newton(dE, d2E, t_max_guess, kmax, tol);
E_max = E(t_max);

fprintf('\nb) Máxima energía del sistema:\n');
fprintf('   Energía máxima = %.5f\n', E_max);
fprintf('   Ocurre en t = %.5f (Iteraciones Newton: %d)\n', t_max, length(h_max)-1);

% Marcamos el punto máximo en la gráfica
plot(t_max, E_max, 'rs', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
legend('E(t)', 'E = 1.5', 'Puntos E(t) = 1.5', 'Energía máxima');

% -----------------------------------------------------------------
% c) Determinar instante de máxima tasa de crecimiento
% -----------------------------------------------------------------

% Para la máxima tasa de crecimiento, buscamos d²E(t)/dt² = 0
% Sabemos que esto ocurre antes del máximo

% En lugar de Newton, usaremos bisección que es más robusta para este caso
% Primero investigamos gráficamente la ubicación aproximada del punto de inflexión

t_small = linspace(0, 0.5, 1000);
d2E_values = d2E(t_small);

figure(3);
plot(t_small, d2E_values, 'b-', 'LineWidth', 2);
grid on;
xlabel('Tiempo (t)');
ylabel('d²E(t)/dt²');
title('Segunda derivada de la energía');

% Usamos bisección para encontrar el punto donde d2E = 0
% Buscamos un cambio de signo en la segunda derivada
a = 0.01; % empezamos cerca de cero
b = 0.5;  % hasta antes del máximo de energía

[t_inflexion, h_inflexion] = biseccion(d2E, a, b, kmax, tol);
E_inflexion = E(t_inflexion);
dE_inflexion = dE(t_inflexion);

fprintf('\nc) Máxima tasa de crecimiento instantánea:\n');
fprintf('   Ocurre en t = %.5f (Iteraciones bisección: %d)\n', t_inflexion, length(h_inflexion));
fprintf('   Valor de la energía en ese punto = %.5f\n', E_inflexion);
fprintf('   Tasa máxima = %.5f\n', dE_inflexion);

% Graficamos la derivada para visualizar
figure(2);
plot(t_range, dE(t_range), 'b-', 'LineWidth', 2);
grid on;
hold on;
plot([t_inflexion], [dE_inflexion], 'rs', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
xlabel('Tiempo (t)');
ylabel('dE(t)/dt');
title('Tasa de crecimiento de la energía');
legend('dE(t)/dt', 'Máxima tasa de crecimiento');

% Marcar el punto de inflexión en la gráfica original
figure(1);
plot(t_inflexion, E_inflexion, 'mv', 'MarkerSize', 10, 'MarkerFaceColor', 'm');
legend('E(t)', 'E = 1.5', 'Puntos E(t) = 1.5', 'Energía máxima', 'Máx. tasa de crecimiento');

