% Definición de constantes del problema
W1 = 2; % cm
L_total = 6; % cm (altura total de la aleta en la ecuación)
L1 = 4; % cm (altura de la aleta desde la base, dominio de solución)
D = 0.2; % cm
k = 2.04; % W/(cm °C)
H = 6e-3; % W/(cm^2 °C)
uw = 200; % °C
uE = 40; % °C

% Calcular coeficientes constantes C1 y C2
C1 = (D * W1) / L_total;
C2 = H / k;

% Definición de las funciones p(x), q(x), r(x)
% Ecuación: -u''(x) + p(x)u'(x) + q(x)u(x) + r(x) = 0
f_ejercicio7 = @(x) [
    1./(L_total - x), ... % p(x) = 1/(L - x)
    C2 ./ (C1 * (L_total - x)) .* ( (2*W1/L_total)*(L_total - x) + 2*D ), ... % q(x)
    - ( C2 ./ (C1 * (L_total - x)) .* ( (2*W1/L_total)*(L_total - x) + 2*D ) ) * uE ... % r(x)
];

% Intervalo del dominio [a, b]
inter = [0 L1]; % De x=0 a x=L1=4 cm

% Condición de contorno izquierda (Dirichlet): u(a) = alpha
ycd_alpha = uw; % Temperatura del dispositivo eléctrico uw

% Condición de contorno derecha (Robin): A y'(b) + B y(b) = C
% k u'(L1) + H u(L1) = H uE
rob_condition = [k H H*uE];

% Cantidad de subintervalos para graficar y buena precisión
L_subs = 200;

% Resolver usando el método de diferencias finitas con condición Robin
[x_sol, y_sol] = dif_fin_rob(f_ejercicio7, inter, ycd_alpha, rob_condition, L_subs);

% (a) Graficar la distribución de la temperatura
figure;
plot(x_sol, y_sol, '-b', 'LineWidth', 1.5);
xlabel('Posición x (cm)');
ylabel('Temperatura u(x) (°C)');
title('Distribución de Temperatura en la Aleta del Disipador');
grid on;

% (b) Estimar el flujo de calor
A1 = D * W1; % Área transversal en x=0
delta_x = (inter(2) - inter(1)) / L_subs; % Tamaño de la malla h

u_x1 = y_sol(2); % Temperatura en el primer nodo interno (x_sol(2))
u_w = y_sol(1); % Temperatura en x=0 (y_sol(1))

flujo_calor = - (k * A1 / delta_x) * (u_x1 - u_w);

fprintf('El flujo de calor estimado es: %.4f W\n', flujo_calor);

% Explicación:
% Se calculó el área transversal A1 en x=0.
% Se obtuvo el tamaño de la malla (delta_x).
% Se extrajeron las temperaturas del primer nodo interno (u(x1)) y del contorno izquierdo (uw) de la solución numérica.
% Finalmente, se aplicó la fórmula dada para el flujo de calor para obtener el resultado.
