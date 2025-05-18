% Definí tu función g(x) acá
g = @(x) (3 + x - 2*x.^2).^(1/4);

% Derivada numérica centrada
h = 1e-6;
dg = @(x) (g(x + h) - g(x - h)) / (2 * h);

% Intervalo de evaluación
x = linspace(1, 1.5, 500);

% Evaluamos |g'(x)|
abs_dg = abs(arrayfun(dg, x));

% Graficamos
figure;
plot(x, abs_dg, 'b', 'LineWidth', 1.5, 'DisplayName', '|g''(x)|'); hold on;
plot(x, ones(size(x)), '--k', 'DisplayName', 'y = 1'); % Línea de referencia

xlabel('x');
ylabel('|g''(x)|');
title('Valor absoluto de la derivada de g(x)');
legend('show');
ylim([0 2]);
grid on;

