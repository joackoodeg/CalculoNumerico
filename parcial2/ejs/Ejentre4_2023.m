% x '' = gR^2 / (x + R)^2
clc;

format long;

g = 9.81;
R = 6373002;
v0 = 1409.34;

f = @(t,x) [x(2); (-g*R^2) ./ (x(1) + R).^2 ];

x0 = [0 v0];

% 3 minutos = 180s
inter = [0 180];
h = 0.01;
L = (inter(2) - inter(1))/h;
[t,y]=rk4(f, inter, x0, L);

disp("magnitud velocidad");
disp(y(end,2));

plot(t, y(:,1)); % se ve q el max es entre 100 y 180

[altura_max, idx]= max(y(:,1));
disp("altura max");
disp(altura_max);

disp("tiempo");
disp(t(idx));

