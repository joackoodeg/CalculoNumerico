% --------------------------------------------------------------------------
% Script para resolver el Ejercicio 6 sin simplificación manual previa
% Versión corregida y explicada
% --------------------------------------------------------------------------
clear all; close all; clc;

% --- Parámetros físicos del problema ---
% Extraídos directamente del enunciado del Ejercicio 6.
K0 = 0.9;   % Conductividad térmica [cal/(s cm °C)]
H = 15;     % Coeficiente de transferencia de calor [cal/(s cm^2 °C)]
uE = 4;     % Temperatura exterior [°C]

% --- Dominio y condiciones de contorno ---
inter = [0, 5]; % Dominio de la barra [cm]
ycd = 6;        % Temperatura fija en x=0 (Dirichlet) [°C]
L = 5000;       % Número de subintervalos para una buena precisión

% --------------------------------------------------------------------------
% Preparación de parámetros para el solver 'dif_fin_rob'
% --------------------------------------------------------------------------

% 1. FUNCIONES p, q, r
% Se definen a partir de la EDO: -K0*u'' + cR*u = f_fuente
% que se reordena a: u'' = (cR/K0)*u - (f_fuente/K0)
cR = @(x) 1.05 * x + 2;      % Coeficiente reactivo
f_fuente = @(x) 5 * x .* (5 - x); % Fuente de calor

p = @(x) 0.*x; % No hay término con primera derivada
q = @(x) cR(x) / K0;
r = @(x) -f_fuente(x) / K0; % CORRECCIÓN: Se agrega el signo negativo

f = @(x) [p(x), q(x), r(x)];

% 2. CONDICIÓN DE ROBIN [A, B, C]
% Se define a partir de: -K0*u'(b) = H*(u(b) - uE)
% que se reordena a: (-K0)*u'(b) + (-H)*u(b) = -H*uE
A = -K0; % CORRECCIÓN: Signo negativo
B = -H;
C = -H * uE;

rob = [A, B, C];

% --------------------------------------------------------------------------
% Resolución Numérica y Visualización de Resultados
% --------------------------------------------------------------------------

% Se asume que la función dif_fin_rob.m está en la misma carpeta
[x, y] = dif_fin_rob(f, inter, ycd, rob, L);

% --- Resultados ---
% Temperatura en el punto medio de la barra (x = 2.5 cm)
% Se busca el índice más cercano a x=2.5 para robustez
[~, idx_medio] = min(abs(x - 2.5));
fprintf("Temperatura en x = 2.5 cm: %.4f °C\n", y(idx_medio));

% Temperatura máxima en la barra
[max_temp, idx_max] = max(y);
fprintf("Temperatura máxima: %.4f °C, alcanzada en x = %.2f cm\n", max_temp, x(idx_max));

% --- Gráfica ---
figure;
plot(x, y, 'b-', 'LineWidth', 2);
hold on;
plot(x(idx_medio), y(idx_medio), 'ko', 'MarkerFaceColor', 'red', 'MarkerSize', 8);
plot(x(idx_max), max_temp, 'ks', 'MarkerFaceColor', 'yellow', 'MarkerSize', 8);
title('Distribución de Temperatura en la Barra (Ejercicio 6 - Corregido)');
xlabel('Posición x (cm)');
ylabel('Temperatura u(x) (°C)');
legend('Perfil de Temperatura', 'Punto Medio (x=2.5)', 'Temperatura Máxima');
grid on;
box on;
