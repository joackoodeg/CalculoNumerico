% Parámetros
L = 1;
h = 3/4;
g = 9.81;

% L * cos(theta0) = h
theta0 = acos(h / L);

% Función de amortiguamiento
f_amort = @(theta) (abs(theta) < theta0) * 0.8;

% Sistema de ecuaciones (ahora sí columna)
pendulo = @(t, x) [x(2); -sin(x(1)) - f_amort(x(1)) * x(2)];

% Condiciones iniciales
x0 = [pi/2; 0];  % columna porque rk4 trabaja con columnas
t0 = 0;
tf = 5;
N = 100;

% Llamada a rk4
[t, x] = rk4(pendulo, [t0 tf], x0, N);

% Mostrar posición final
pos = x(end,1);
printf("posicion %.5f\n", pos);

theta_pos = x(end,2);

if theta_pos < 0
  printf("    Dirección: derecha a izquierda\n");
else
  printf("    Dirección: izquierda a derecha\n");
endif

%%% b)
inter = [0 10];

[tb, xb] = rk4(pendulo, inter, x0, 100);
theta_pos_b = xb(:,2);
plot(tb, theta_pos_b);

thetapoly = polyfit(tb,theta_pos_b, 10);
thetaval = @(tb) polyval(thetapoly,tb);

[xraiz, hist] = biseccion(thetaval, 3, 4, 100, 1e-4);
printf("(b) Cambio de dirección en t = %.5f s\n", xraiz);
