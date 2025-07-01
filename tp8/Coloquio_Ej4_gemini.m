## Limpiar el espacio de trabajo
clear all;
clc;
clf;

## 1. Definir los parámetros de entrada para la función

% a. Función 'f' que devuelve [p(x), q(x), r(x)] en columnas
p = @(x) (2*x)./(1-x.^2);
q = @(x) -42 ./(1-x.^2);
r = @(x) zeros(size(x));
f = @(x) [ p(x) , q(x) , r(x)];

% b. Intervalo [a, b]
inter = [-1, 1];

% c. Condiciones de contorno [y(a), y(b)]
yc = [1, 1];

% d. Cantidad de subintervalos
L = 10000; % Puedes aumentar este valor para obtener una curva más suave

## 2. Llamar a la función para resolver el problema
[x, y] = dif_fin_dir(f, inter, yc, L);

idx = find(x >= 0, 1);
disp(y(idx));
