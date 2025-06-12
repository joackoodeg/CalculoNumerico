f = @(x) [zeros(length(x),1), zeros(length(x),1), -20 * sin(5*(x - 1))];
% -> p=0, q=0, r=20 * sin(5*(x - 1))

% ext izq = 21 -> u(0) = 21
% ext derecho aislado -> u'(3) = 0

L = 3;
ycd = 21;
rob = [1 0 0];  % condición Neumann: u'(3) = 0
n = 80;         % cantidad de subintervalos

[x, y] = dif_fin_rob(f, [0 L], ycd, rob, n);

% Graficar la solución
plot(x, y, '-o');
xlabel('x');
ylabel('Temperatura');
title('Temperatura en la barra');
grid on;

% Mostrar el valor de temperatura en el extremo derecho
fprintf('Temperatura en x = 3: %.2f\n', y(end));

% Estimar el punto de temperatura máxima
[val, idx] = max(y);
fprintf('Máxima temperatura: %.2f en x = %.2f\n', val, x(idx));
