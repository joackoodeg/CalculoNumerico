%% a)
f = @(x) exp(x) - 2*x.^2 + 3*x - 1;
df_exacta = exp(0) - 0 + 3;  % f'(0) = e^0 + 3 = 1 + 3 = 4
x0 = 0;
h_vec = logspace(-11, -1, 100);  % 100 valores entre 1e-11 y 1e-1

df_aprox = (f(x0 + h_vec) - f(x0)) ./ h_vec;
error_progresiva = abs(df_aprox - df_exacta);

figure();
loglog(h_vec, error_progresiva, 'b.-');
xlabel('h');
ylabel('Error absoluto');
title('Error absoluto de la derivada con fórmula progresiva');
grid on;

%% b)
f2 = @(x) exp(x) - 4;
M = max(abs(f2([0, 0.1])));  % Evaluar en extremos
h = 0.1;
error_teorico = (M / 2) * h

df_aprox_h01 = (f(x0 + h) - f(x0)) / h;
error_real = abs(df_aprox_h01 - df_exacta)

%% c)
% Usar el mismo vector h_vec de (a)
df_centrada = (f(x0 + h_vec) - f(x0 - h_vec)) ./ (2*h_vec);
error_centrada = abs(df_centrada - df_exacta);

figure();
loglog(h_vec, error_centrada, 'r.-');
hold on;
loglog(h_vec, error_progresiva, 'b.-');
legend('Centrada', 'Progresiva');
xlabel('h');
ylabel('Error absoluto');
title('Comparación de errores: centrada vs progresiva');
grid on;

