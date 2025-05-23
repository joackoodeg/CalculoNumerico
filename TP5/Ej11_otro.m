% === Datos ===
t = (0:25)' * (1/5);  % tiempo en horas
v = [0.61255, 1.40101, 2.69013, 3.40985, 3.95361, 3.59041, ...
     3.09119, 2.71147, 2.01397, 1.35229, 1.09930, 1.30715, ...
     1.99290, 3.46081, 5.34487, 7.50176, 9.35324, 11.22945, ...
     12.76212, 13.99448, 14.41532, 14.47064, 13.91045, ...
     13.01681, 12.18537, 11.26826]';

% === (a) Ajuste v(t) = c1*sin(2t) + c2*t^2 + c3*t^3 + c4 ===
f1 = @(t) sin(2*t);
f2 = @(t) t.^2;
f3 = @(t) t.^3;
f4 = @(t) ones(size(t));

% Construcción de la matriz M
M1 = [f1(t), f2(t), f3(t), f4(t)];

% Sistema normal
A1 = M1' * M1;
b1 = M1' * v;
c = A1 \ b1;

printf("\n(a) Coeficientes del modelo v(t) = c1*sin(2t) + c2*t^2 + c3*t^3 + c4:\n");
printf("c1 = %.4f\nc2 = %.4f\nc3 = %.4f\nc4 = %.4f\n", c(1), c(2), c(3), c(4));

% Predicción v(6)
v6_a = c(1)*sin(2*6) + c(2)*6^2 + c(3)*6^3 + c(4);
printf("Predicción v(6) con modelo (a): %.4f km/h\n", v6_a);

% === (b) Ajuste polinomial grado 6 ===
p = polyfit(t, v, 6);
v6_b = polyval(p, 6);
printf("\n(b) Predicción v(6) con polinomio grado 6: %.4f km/h\n", v6_b);

% === (c) Errores cuadráticos ===
v_ajuste_a = M1 * c;
ECM_a = mean((v - v_ajuste_a).^2);

v_ajuste_b = polyval(p, t);
ECM_b = mean((v - v_ajuste_b).^2);

printf("\n(c) Error cuadrático medio (a): %.6f\n", ECM_a);
printf("Error cuadrático medio (b): %.6f\n", ECM_b);

if ECM_a < ECM_b
    printf("➡️  El modelo (a) ajusta mejor (menor ECM).\n");
else
    printf("➡️  El modelo (b) ajusta mejor (menor ECM).\n");
endif

% === (d) Cálculo de la distancia total usando el mejor modelo ===
% Elegimos el modelo con menor ECM
if ECM_a < ECM_b
    f_dist = @(t) c(1)*sin(2*t) + c(2)*t.^2 + c(3)*t.^3 + c(4);
else
    f_dist = @(t) polyval(p, t);
endif

% Integración numérica para hallar distancia
dist = quad(f_dist, 0, 6);  % integral de la velocidad
printf("\n(d) Distancia recorrida en las primeras 6 horas: %.4f km\n", dist);

