 % Tiempo en horas (cada 12 minutos = 1/5 h)
t = (0:25) * (1/5);

% Velocidades medidas (en km/h)
v = [0.61255, 1.40101, 2.69013, 3.40985, 3.95361, 3.59041, ...
     3.09119, 2.71147, 2.01397, 1.35229, 1.09930, 1.30715, ...
     1.99290, 3.46081, 5.34487, 7.50176, 9.35324, 11.22945, ...
     12.76212, 13.99448, 14.41532, 14.47064, 13.91045, ...
     13.01681, 12.18537, 11.26826];
# A

% Matriz de diseño
A = [sin(2*t') t'.^2 t'.^3 ones(length(t), 1)];

% Resolver sistema de mínimos cuadrados
c = A \ v';

% Mostrar coeficientes con 4 decimales
printf("Coeficientes del modelo (a):\n");
printf("c1 = %.4f\nc2 = %.4f\nc3 = %.4f\nc4 = %.4f\n", c);

% Predecir velocidad a las 6 horas
v6_a = c(1)*sin(2*6) + c(2)*6^2 + c(3)*6^3 + c(4);
printf("Predicción v(6) modelo (a): %.4f km/h\n", v6_a);

# B

% Ajuste polinomial grado 6
p = polyfit(t, v, 6);

% Mostrar coeficientes
disp("Coeficientes del polinomio grado 6:");
disp(p');

% Predecir v(6)
v6_b = polyval(p, 6);
printf("Predicción v(6) modelo (b): %.4f km/h\n", v6_b);

# C
% Modelo (a)
v_a = A * c;
ECM_a = mean((v' - v_a).^2);

% Modelo (b)
v_b = polyval(p, t);
ECM_b = mean((v - v_b).^2);

printf("Error cuadrático medio modelo (a): %.6f\n", ECM_a);
printf("Error cuadrático medio modelo (b): %.6f\n", ECM_b);

# D
% Modelo elegido: polinomio grado 6 (b)
f = @(t) polyval(p, t);  % función anónima

% Integrar de t=0 a t=6
distancia = quad(f, 0, 6);  % si da error, usa `integral(f, 0, 6)` en versiones nuevas
printf("Distancia recorrida en 6 horas (modelo b): %.4f km\n", distancia);

