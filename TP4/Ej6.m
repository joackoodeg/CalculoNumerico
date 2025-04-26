% Datos
a = 0.401; % Pa·m^6
b = 42.7e-6; % m^3
N = 1000; % moléculas
T = 300; % K
p = 3.5e7; % Pa
k = 1.3806503e-23; % J/K

% Función f(V)
f = @(V) (p + a*(N/V)^2)*(V - N*b) - k*N*T;

% Derivada f'(V)
%df = @(V) p + a*((N^2)/(V^2) - 2*(N^2)*(V-N*b)/(V^3));

h = 1e-8; % paso pequeño
df = @(V) (f(V + h) - f(V)) / h;

% Parámetros del método
tol = 1e-12;
kmax = 100;

% Intervalo inicial para bisección (una suposición razonable)
Vmin = N*b; % m³
Vmax = 0.06; % m³


% Método de Bisección
[x_biseccion, h_bisec] = biseccion(f, Vmin, Vmax, kmax, tol);
fprintf('Bisección: V = %.12e m^3, iteraciones = %d\n', x_biseccion, length(h_bisec)-1);

% Método de Newton
[x_newton, h_newton] = newton(f, df, (Vmin+Vmax)/2, kmax, tol);
fprintf('Newton: V = %.12e m^3, iteraciones = %d\n', x_newton, length(h_newton)-1);

