clc;
format long;

A = 0.01;
inter = [0 2];
c = 0.217;
p = 2.7;
k0= 0.57;

f1 = @(x) 12 * cos(2 * x);
cr = @(x) 5*(x-2);
ycd = 6;

q = @(x) cr(x)/k0;
r = @(x) -f1(x)/k0; % r(x) es negativo

% u'' = (cr(x)/k0)*u - f1(x)/k0
F = @(x) [0 .* x, q(x), r(x)];

% -k0*u'(2) = -40  --->  k0*u'(2) = 40
% Formato: A*u'(b) + B*u(b) = C
% A = k0, B = 0, C = 40
rob = [k0, 0, 40];

h = 0.001;
L = (inter(2) - inter(1))/h;

[x,y]=dif_fin_rob(F,inter,ycd,rob,L);
plot(x,y);
title('Perfil de Temperatura Corregido');
xlabel('Posición en la barra x (cm)');
ylabel('Temperatura u(x) (°C)');
grid on;

%% a
u_a= (y(2) - y(1)) / h;
phi_a = -k0 * u_a
fprintf('El flujo en el extremo izquierdo es: phi(0) = %.4f cal/(s·cm²)\n', phi_a);

%% b
% Calcular la integral de la solución correcta
yb = trapz(x,y);

% Calcular la energía
E = A*c*p*yb;

disp('La energía térmica total calculada (E) es:');
disp(E);

%% c

u0 = 6;

%% ϕ(x)=−K0​u′(x)
%% ϕ(0)=−20
%% −20=−K0​u′(0)
%% u'= 20/k0

u_prime_0 = 20 / k0;
y0 = [u0; u_prime_0];

% 2. Sistema de EDOs de 1er orden para rk4
%    y' = F(x, y), donde y = [y1; y2] = [u; u']
%    y1' = y2
%    y2' = q(x)*y1 + r(x)
F_ivp = @(x, y) [y(2); q(x)*y(1) + r(x)];

[x, sol] = rk4(F_ivp, inter, y0, L);

u_final = sol(end, 1);
u_prime_final = sol(end, 2);

% Calcular el flujo en x=2
phi_final = -k0 * u_prime_final;

fprintf('La temperatura en el extremo derecho es: u(2) = %.6f °C\n', u_final);
fprintf('El flujo en el extremo derecho es: phi(2) = %.6f cal/(s·cm²)\n', phi_final);

