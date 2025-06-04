% Funciones g1, g2, g3, g4
g1 = @(x) (3 + x - 2*x.^2).^(1/4);
g2 = @(x) sqrt((x + 3 - x.^4) / 2);
g3 = @(x) sqrt((x + 3) ./ (x.^2 + 2));
g4 = @(x) (3*x.^4 + 2*x.^2 + 3) ./ (4*x.^3 + 4*x - 1);

% Derivada numérica mejor (diferencia centrada)
h = 1e-6;
dg1 = @(x) (g1(x+h) - g1(x-h)) / (2*h);
dg2 = @(x) (g2(x+h) - g2(x-h)) / (2*h);
dg3 = @(x) (g3(x+h) - g3(x-h)) / (2*h);
dg4 = @(x) (g4(x+h) - g4(x-h)) / (2*h);

% Vector de x
x = linspace(1, 1.5, 500);

% Evaluamos |g'(x)|
abs_dg1 = abs(arrayfun(dg1, x));
abs_dg2 = abs(arrayfun(dg2, x));
abs_dg3 = abs(arrayfun(dg3, x));
abs_dg4 = abs(arrayfun(dg4, x));

% Graficamos
figure;
plot(x, abs_dg1, 'r', 'DisplayName', '|g1''(x)|'); hold on;
plot(x, abs_dg2, 'g', 'DisplayName', '|g2''(x)|');
plot(x, abs_dg3, 'b', 'DisplayName', '|g3''(x)|');
plot(x, abs_dg4, 'm', 'DisplayName', '|g4''(x)|');
plot(x, ones(size(x)), '--k', 'DisplayName', 'y=1');

xlabel('x');
ylabel('|g''(x)|');
title('Derivadas absolutas de g_i en [1, 1.5]');
legend('show');
ylim([0 2]); % ACA LIMITAMOS el eje y entre 0 y 2
grid on;

