%% a)

%% IMPORTANTE QUE SEA EN ESTE ORDEN: f, x, y
f = @(x) sin(2*pi*x);
x = linspace(-1, 1, 21);
y = f(x);
xx = linspace(-1, 1, 500);

%% Cubic
[yy,dyy,ddyy]=funcion_spline(x,y)

% Gráfica original
figure(1); hold on;
plot(xx, yy(xx), 'b--'); hold on;
plot(xx, f(xx), 'k'); hold on;
title('Interpolación con datos originales');
grid on;
