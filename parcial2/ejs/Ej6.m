% Parámetros del sistema
m = 20;
k = 20;
c = 10;

% EDO en forma de sistema de primer orden
f = @(t, x) [x(2); -(c/m)*x(2) - (k/m)*x(1)];

% Condiciones iniciales:
% x(0)=1 -> 1 metro a la derecha
% v(0)=0 -> del reposo
x0 = [1; 0];

% Método de Runge-Kutta 4 (debes tener esta función definida)
[t, y] = rk4(f, [0 10], x0, 100);  % 100 pasos

% Extraer posición y velocidad
pos = y(:,1);
vel = y(:,2);

% Ajuste polinómico de la velocidad
pf = polyfit(t, vel, 10);  % Grado 10
pv = @(t) polyval(pf, t);

% Derivada del polinomio para encontrar extremos (vel. máxima)
dpf = polyder(pf);
dpv = @(t) polyval(dpf, t);

% Buscar el instante donde dv/dt = 0, usamos bisección
[punto, ~] = biseccion(dpv, 1, 2, 100, 1e-4);  % Búsqueda en ventana estimada

% Evaluamos velocidad máxima
vmax = pv(punto);

% Mostrar resultados
fprintf("Velocidad máxima: %.2f m/s en t = %.2f s\n", vmax, punto);

% Evaluamos posición a los 10 segundos
pf_x = polyfit(t, pos, 10);
x10 = polyval(pf_x, 10);
fprintf("Posición en t = 10 s: %.5f m\n", x10);

%%% Como hacer el despeje:

%% fT = -cv -kx + F, siendo F = m*a = m* x''

% m*x'' + c*x' + k*x = 0

% m*x'' = -c* x' + -k * x
% x'' = -c/m* x' + -k/m * x

