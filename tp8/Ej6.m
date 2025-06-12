% Definición de las funciones p, q, r para el problema (forma estándar: -y'' + p y' + q y + r = 0)
% Ecuación: -0.9 u''(x) + (1.05x + 2)u(x) = 5x(5-x)
% Dividiendo por -0.9: u''(x) - ((1.05x + 2)/0.9)u(x) = -(5x(5-x)/0.9)
% Multiplicando por -1: -u''(x) + ((1.05x + 2)/0.9)u(x) + (5x(5-x)/0.9) = 0
% Entonces:
% p(x) = 0
% q(x) = (1.05x + 2) / 0.9
% r(x) = 5x(5-x) / 0.9

f_ejercicio6 = @(x) [zeros(size(x)) (1.05*x + 2)/0.9 (5*x.*(5-x))/0.9];

% Intervalo del dominio [a, b]
inter = [0 5]; % Longitud de la barra L=5 cm

% Condición de contorno izquierda (Dirichlet): u(a) = alpha
ycd_alpha = 6; % Temperatura fija de 6°C en x=0

% Condición de contorno derecha (Robin): A y'(b) + B y(b) = C
% De -0.9 u'(5) = 15(u(5)-4) => 0.9 u'(5) + 15 u(5) = 60
rob_condition = [0.9 15 60];

% Cantidad de subintervalos para precisión (mayor L, mayor precisión)
L_val = 400; % Intentamos con L=400 para 4 decimales exactos

% Resolver usando el método de diferencias finitas con condición Robin
[x_sol, y_sol] = dif_fin_rob(f_ejercicio6, inter, ycd_alpha, rob_condition, L_val);

% Encontrar la temperatura en el punto medio de la barra (x = 2.5)
% Como x_sol es un vector de nodos espaciados uniformemente, podemos encontrar el nodo más cercano a 2.5
[~, idx_mid_point] = min(abs(x_sol - 2.5));
temp_mid_point = y_sol(idx_mid_point);

fprintf('La temperatura en el punto medio (x=2.5 cm) de la barra es: %.4f °C\n', temp_mid_point);

% Explicación:
% 1. Se planteó la ecuación diferencial y se identificaron p(x), q(x) y r(x) para la forma estándar.
% 2. Las condiciones de contorno (Dirichlet en x=0 y Robin en x=5) se definieron con los parámetros adecuados para la función 'dif_fin_rob'.
% 3. Se eligió un número de subintervalos (L=400) para asegurar la precisión requerida.
% 4. Se ejecutó la función 'dif_fin_rob' para obtener la distribución de temperatura 'y_sol' en los nodos 'x_sol'.
% 5. Se localizó el nodo más cercano a x=2.5 (punto medio) y se extrajo la temperatura correspondiente.

% (Opcional) Graficar la distribución de temperatura
figure;
plot(x_sol, y_sol, '-b');
xlabel('Posición x (cm)');
ylabel('Temperatura u(x) (°C)');
title('Distribución de Temperatura en la Barra de Cobre (Ejercicio 6)');
grid on;
hold on;
plot(x_sol(idx_mid_point), temp_mid_point, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(x_sol(idx_mid_point) + 0.1, temp_mid_point, sprintf('Temp en x=2.5: %.4f °C', temp_mid_point), 'VerticalAlignment', 'bottom');
hold off;

% Verificación de precisión: se puede probar con un L mayor para ver si el cuarto decimal cambia
% L_val_test = 800;
% [x_test, y_test, ~] = dif_fin_rob(f_ejercicio6, inter, ycd_alpha, rob_condition, L_val_test);
% [~, idx_mid_point_test] = min(abs(x_test - 2.5));
% temp_mid_point_test = y_test(idx_mid_point_test);
% fprintf('Temperatura con L=800: %.4f °C\n', temp_mid_point_test);
