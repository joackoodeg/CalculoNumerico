% Etapa 1: t en [0,1,2]
t1 = [0 1 2];
x1 = [0 2 6];
y1 = [0 4 6];

% En reposo: derivadas 0 en t=0 y t=2
dx1 = 0; dx2 = 0;
dy1 = 0; dy2 = 0;

[ax1,bx1,cx1,dx1] = cubic_spline_clamped(t1, x1, dx1, dx2);
[ay1,by1,cy1,dy1] = cubic_spline_clamped(t1, y1, dy1, dy2);

% Etapa 2: t en [2,3,4]
t2 = [2 3 4];
x2 = [6 3 0];
y2 = [6 2 0];

% En reposo: derivadas 0 en t=2 y t=4
dx1b = 0; dx2b = 0;
dy1b = 0; dy2b = 0;

[ax2,bx2,cx2,dx2] = cubic_spline_clamped(t2, x2, dx1b, dx2b);
[ay2,by2,cy2,dy2] = cubic_spline_clamped(t2, y2, dy1b, dy2b);

% Crear puntos de evaluación
tt1 = linspace(0,2,100);
tt2 = linspace(2,4,100);
%xt1 = zeros(size(tt1)); yt1 = zeros(size(tt1));
%xt2 = zeros(size(tt2)); yt2 = zeros(size(tt2));

% Evaluar splines por tramos
xt1 = spline_eval(tt1, t1, ax1, bx1, cx1, dx1);
yt1 = spline_eval(tt1, t1, ay1, by1, cy1, dy1);
xt2 = spline_eval(tt2, t2, ax2, bx2, cx2, dx2);
yt2 = spline_eval(tt2, t2, ay2, by2, cy2, dy2);

% Graficar x(t) y y(t)
figure;
subplot(2,1,1);
plot(tt1, xt1, 'b', tt2, xt2, 'r'); grid on;
title('x vs t'); xlabel('t'); ylabel('x');

subplot(2,1,2);
plot(tt1, yt1, 'b', tt2, yt2, 'r'); grid on;
title('y vs t'); xlabel('t'); ylabel('y');

% Graficar trayectoria en el plano xy
figure;
plot(xt1, yt1, 'b', xt2, yt2, 'r'); grid on;
title('Trayectoria del brazo en el plano xy');
xlabel('x'); ylabel('y'); axis equal;

