 % Tiempo en horas (cada 12 minutos = 1/5 h)
t = (0:25)' * (1/5);

% Velocidades medidas (en km/h)
v = [0.61255, 1.40101, 2.69013, 3.40985, 3.95361, 3.59041, ...
     3.09119, 2.71147, 2.01397, 1.35229, 1.09930, 1.30715, ...
     1.99290, 3.46081, 5.34487, 7.50176, 9.35324, 11.22945, ...
     12.76212, 13.99448, 14.41532, 14.47064, 13.91045, ...
     13.01681, 12.18537, 11.26826]';
# A

% Matriz de diseño
f1 = @(t) sin(2 .* t);
f2 = @(t) t .^ 2;
f3 = @(t) 2 .^ t;
f4 = @(t) ones(size(t));

M = [f1(t), f2(t), f3(t), f4(t)];

% Resolver sistema de mínimos cuadrados
A = M' * M;
b = M' * v;
c = A \ b;

%% a )
printf("Coeficientes del modelo (a):\n");
printf("c1 = %.4f\nc2 = %.4f\nc3 = %.4f\nc4 = %.4f\n", c);

% prediccion:
v_6 = c(1) * sin(12) + c(2)*(6^2) + c(3) * (2^6) + c(4);
printf("prediccion a): %.4f", v_6);

%% b )
p = polyfit(t,v,6);
v_6_mc = polyval(p,6);
printf("prediccion b): %.4f", v_6_mc);

% c ) Errores cuadráticos
v_ajuste_a = M * c;
ECM_a = mean((v - v_ajuste_a).^2);

v_ajuste_b = polyval(p, t);
ECM_b = mean((v - v_ajuste_b).^2);

printf("\n(c) Error cuadrático medio (a): %.6f\n", ECM_a);
printf("Error cuadrático medio (b): %.6f\n", ECM_b);

% c)
if ECM_a < ECM_b
    printf("El modelo (a) ajusta mejor (menor ECM).\n");
else
    printf("El modelo (b) ajusta mejor (menor ECM).\n");
endif

% (d) Cálculo de la distancia total usando el mejor modelo ===
% Elegimos el modelo con menor ECM
if ECM_a < ECM_b
    f_dist = @(t) c(1)*sin(2*t) + c(2)*t.^2 + c(3)*t.^3 + c(4);
else
    f_dist = @(t) polyval(p, t);
endif

% Integración numérica para hallar distancia
dist = quad(f_dist, 0, 6);  % integral de la velocidad
printf("\n(d) Distancia recorrida en las primeras 6 horas: %.4f km\n", dist);

