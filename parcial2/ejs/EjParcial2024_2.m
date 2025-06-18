clear all; close all; clc;
format long;

% Datos del problema
l = 12;      % longitud del brazo (m)
m1 = 3;       % masa 1 (kg)
m2 = 1;       % masa 2 (kg)
k = 5;        % constante del resorte (N/m)
g = 9.81;     % aceleración de la gravedad (m/s²)

% Condiciones iniciales
x1_0 = 0.75;  % posición inicial del primer objeto (m)
x2_0 = 0.25;  % posición inicial del segundo objeto (m)
v1_0 = 0;     % velocidad inicial del primer objeto (m/s)
v2_0 = 0;     % velocidad inicial del segundo objeto (m/s)

% Vector de condiciones iniciales [x1, v1, x2, v2]
y0 = [x1_0; v1_0; x2_0; v2_0];

% Tiempo de simulación
inter = [0 10];  % desde 0 hasta 10 segundos
L = 1000;        % número de pasos

% Definir el sistema de ecuaciones diferenciales
% El sistema es:
% m1*x1'' = -(m1*g/l)*x1 - k*(x1 - x2)
% m2*x2'' = -(m2*g/l)*x2 + k*(x1 - x2)
%
% En forma de sistema de primer orden:
% y(1) = x1,  y(2) = x1',  y(3) = x2,  y(4) = x2'
% y'(1) = y(2)
% y'(2) = -(g/l)*y(1) - (k/m1)*(y(1) - y(3))
% y'(3) = y(4)
% y'(4) = -(g/l)*y(3) + (k/m2)*(y(1) - y(3))

f = @(t, y) [y(2);
             -(g/l)*y(1) - (k/m1)*(y(1) - y(3));
             y(4);
             -(g/l)*y(3) + (k/m2)*(y(1) - y(3))];

% Resolver el sistema usando RK4
[t, y] = rk4(f, inter, y0, L);

% Extraer las posiciones y velocidades
x1 = y(:,1);  % posición del primer objeto
v1 = y(:,2);  % velocidad del primer objeto
x2 = y(:,3);  % posición del segundo objeto
v2 = y(:,4);  % velocidad del segundo objeto

% Encontrar los valores a los 10 segundos (último punto)
x1_10s = x1(end);
v1_10s = v1(end);
x2_10s = x2(end);
v2_10s = v2(end);

% Mostrar resultados
fprintf('=== RESULTADOS A LOS 10 SEGUNDOS (RK4) ===\n');
fprintf('Posición del primer objeto: %.6f m\n', x1_10s);
fprintf('Velocidad del primer objeto: %.6f m/s\n', v1_10s);
if v1_10s > 0
    fprintf('El primer objeto se mueve de derecha a izquierda\n');
elseif v1_10s < 0
    fprintf('El primer objeto se mueve de izquierda a derecha\n');
else
    fprintf('El primer objeto está en reposo instantáneo\n');
end

fprintf('\nPosición del segundo objeto: %.6f m\n', x2_10s);
fprintf('Velocidad del segundo objeto: %.6f m/s\n', v2_10s);
if v2_10s > 0
    fprintf('El segundo objeto se mueve de derecha a izquierda\n');
elseif v2_10s < 0
    fprintf('El segundo objeto se mueve de izquierda a derecha\n');
else
    fprintf('El segundo objeto está en reposo instantáneo\n');
end

