clear all;
close all;
clc;

disp("---------------------------------------------------------------");
disp("Resolución del Ejercicio 1 (Problema de difusión-reacción)");
disp("---------------------------------------------------------------");

% =========================================================================
% Definición de Parámetros y Funciones Globales
% =========================================================================

% Propiedades del material y geométricas
K0 = 0.57;      % Conductividad térmica [cal/(s·cm·°C)]
A = 0.01;       % Área de sección transversal [cm²]
c = 0.217;      % Calor específico [cal/(g·°C)]
rho = 2.7;      % Densidad [g/cm³]
L_bar = 2;      % Largo de la barra [cm]

% Ecuación: u'' = p(x)u' + q(x)u + r(x)
% De -K0*u'' + cR(x)*u = f(x)
% -> u'' = (cR(x)/K0)*u - f(x)/K0

cR = @(x) 5*(x - 2);
f_heat = @(x) 12*cos(2*x);

p = @(x) zeros(size(x));
q = @(x) cR(x) / K0;
r = @(x) -f_heat(x) / K0;

% Función handle para la EDO, compatible con las rutinas del TP
f_ode = @(x) [p(x), q(x), r(x)];

% Número de subintervalos para la discretización
N = 2000; % Usamos un número alto para mayor precisión

% =========================================================================
% Inciso (a): Flujo en x=0 con u(0)=6 y phi(2)=-40
% =========================================================================
disp("--- Inciso (a) ---");

% Intervalo de solución
inter_a = [0, L_bar];

% Condición de Dirichlet en x=0
ycd_a = 6;

% Condición de Robin en x=2: phi(2) = -K0*u'(2) = -40 -> K0*u'(2) = 40
% Formato: A*u'(b) + B*u(b) = C
A_rob = K0;
B_rob = 0;
C_rob = 40;
rob_a = [A_rob, B_rob, C_rob];

% Resolver el problema de valores de contorno
[x_a, u_a] = dif_fin_rob(f_ode, inter_a, ycd_a, rob_a, N);

% Calcular el flujo en x=0: phi(0) = -K0 * u'(0)
% Se aproxima u'(0) usando una diferencia finita hacia adelante
h_a = x_a(2) - x_a(1);
du_dx_0_a = (u_a(2) - u_a(1)) / h_a;
phi_0_a = -K0 * du_dx_0_a;

fprintf('Con u(0)=6 y phi(2)=-40, el flujo en el extremo izquierdo es:\n');
fprintf('phi(0) = %.4f cal/(s·cm²)\n\n', phi_0_a);


% =========================================================================
% Inciso (b): Energía térmica total
% =========================================================================
disp("--- Inciso (b) ---");

% Usar la solución u(x) del inciso (a) para calcular la integral
integral_u = trapz(x_a, u_a);

% Calcular la energía térmica total E
E_total = A * c * rho * integral_u;

fprintf('La energía térmica total de la barra (usando la discretización de (a)) es:\n');
fprintf('E = %.5f cal\n\n', E_total);


% =========================================================================
% Inciso (c): u(2) y phi(2) con phi(0)=-20
% =========================================================================
disp("--- Inciso (c) ---");

% Ahora es un Problema de Valor Inicial (PVI)
% ICs: u(0) = 6  y  phi(0) = -K0*u'(0) = -20
u0_c = 6;
u_prime_0_c = -(-20) / K0;
y0_c = [u0_c; u_prime_0_c]; % Vector de condiciones iniciales [u(0); u'(0)]

% Sistema de EDOs de primer orden para rk4: y' = F(x,y) donde y=[u; u']
% y(1)' = u' = y(2)
% y(2)' = u'' = q(x)*u + r(x) = q(x)*y(1) + r(x)
F_ivp = @(x, y) [y(2); q(x)*y(1) + r(x)];

% Resolver el PVI usando rk4
[x_c, sol_c] = rk4(F_ivp, inter_a, y0_c, N);

% Extraer resultados en x=2
u_2_c = sol_c(end, 1);
u_prime_2_c = sol_c(end, 2);

% Calcular el flujo en x=2
phi_2_c = -K0 * u_prime_2_c;

fprintf('Con phi(0)=-20 (y u(0)=6), los valores en el extremo derecho son:\n');
fprintf('Temperatura u(2) = %.6f °C\n', u_2_c);
fprintf('Flujo phi(2) = %.6f cal/(s·cm²)\n', phi_2_c);
