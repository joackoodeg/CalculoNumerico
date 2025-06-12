% Definición de las funciones p, q, r para el problema
% -K0 u'' = f(x)  => -u'' = f(x)
% Forma general: -y'' + p(x)y' + q(x)y + r(x) = 0
% Entonces: p(x) = 0, q(x) = 0, r(x) = -f(x)
f_ejercicio5 = @(x) [zeros(size(x)) zeros(size(x)) -20*sin(5*(x-1))];

% Intervalo del dominio [a, b]
inter = [0 3];

% Condición de contorno izquierda (Dirichlet): u(a) = alpha
ycd_alpha = 21;

% Condición de contorno derecha (Robin): A y'(b) + B y(b) = C
% Para u'(3) = 0, elegimos A=1, B=0, C=0
rob_condition = [1 0 0];

% Cantidad de subintervalos
L = 100; % Un número suficientemente grande para obtener precisión

% Resolver usando el método de diferencias finitas con condición Robin
[x, y_sol] = dif_fin_rob(f_ejercicio5, inter, ycd_alpha, rob_condition, L);

% La temperatura en el extremo derecho es el último valor de y_sol
temp_extremo_derecho = y_sol(end);

fprintf('La temperatura en el extremo derecho de la barra es: %.2f °C\n', temp_extremo_derecho);

% Explicación:
% Se aplicó el método de diferencias finitas lineal para resolver la EDO de difusión en estado estacionario.
% La ecuación se reescribió en la forma estándar para identificar p(x), q(x) y r(x).
% La condición de contorno izquierda es Dirichlet (temperatura prescrita).
% La condición de contorno derecha es Neumann (extremo aislado, flujo de calor cero),
% la cual se tradujo a una condición tipo Robin con A=1, B=0, C=0 para usar la función `dif_fin_rob`.
% Se discretizó el dominio con L=100 subintervalos, lo que permite una buena aproximación.
% La temperatura en el extremo derecho es el último elemento del vector solución `y_sol`.

% Encontrar el valor máximo de temperatura
[max_temp, idx_max_temp] = max(y_sol);

% Encontrar la posición x correspondiente al valor máximo
pos_max_temp = x(idx_max_temp);

fprintf('La temperatura máxima es: %.2f °C\n', max_temp);
fprintf('Ocurre aproximadamente en x = %.2f\n', pos_max_temp);

% Graficar la distribución de temperatura para visualizar el máximo
plot(x, y_sol, '-o');
xlabel('Posición x');
ylabel('Temperatura u(x) (°C)');
title('Distribución de Temperatura en la Barra');
grid on;
hold on;
plot(pos_max_temp, max_temp, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(pos_max_temp + 0.1, max_temp, sprintf('Max: %.2f °C en x=%.2f', max_temp, pos_max_temp), 'VerticalAlignment', 'bottom');
hold off;

% Explicación:
% Con la solución numérica (vector de temperaturas `y_sol` en los nodos `x`),
% se busca el valor máximo en `y_sol` y el índice correspondiente.
% Ese índice se utiliza para encontrar la coordenada `x` donde ocurre la temperatura máxima.
% Un gráfico de la distribución de temperatura ayuda a visualizar el punto máximo.
