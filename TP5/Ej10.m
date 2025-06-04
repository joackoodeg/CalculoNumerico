% Datos del problema
t = [4 8 12 16 20 24];
c = [1590 1320 1000 900 650 560];

% (a) Determinar b y k utilizando mínimos cuadrados
% Linealizamos el modelo c(t) = b*e^(-kt) tomando logaritmo:
% ln(c) = ln(b) - kt

% Transformación logarítmica
ln_c = log(c);

% Ajuste lineal: ln(c) = A + B*t donde A = ln(b) y B = -k
coef = polyfit(t, ln_c, 1);
B = coef(1);  % Pendiente
A = coef(2);  % Intercepto

% Calculamos los parámetros del modelo original
k = -B;
b = exp(A);

fprintf('Parámetros del modelo c(t) = b*e^(-kt):\n');
fprintf('b = %.2f\n', b);
fprintf('k = %.5f\n', k);

% (b) Estimar la concentración al final de la tormenta (t=0)
c0 = b * exp(-k*0);
fprintf('\nConcentración estimada al final de la tormenta: %.2f CFU/100mL\n', c0);

% (c) Determinar el tiempo donde la concentración será 200 CFU/100mL
% 200 = b*e^(-kt) → ln(200) = ln(b) - kt → t = (ln(b) - ln(200))/k
t_200 = (log(b) - log(200))/k;
fprintf('Tiempo estimado para alcanzar 200 CFU/100mL: %.2f horas\n', t_200);



% Gráfica del modelo y los datos
%t_graf = linspace(0, 40, 100);
%c_modelo = b * exp(-k * t_graf);

%figure;
%plot(t, c, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
%hold on;
%plot(t_graf, c_modelo, 'b-', 'LineWidth', 2);
%plot([0], [c0], 'g*', 'MarkerSize', 10);
%plot([t_200], [200], 'm*', 'MarkerSize', 10);
%xlabel('Tiempo (horas)');
%ylabel('Concentración (CFU/100mL)');
%title('Modelo de concentración bacteriana después de una tormenta');
%legend('Datos medidos', 'Modelo ajustado', 'Concentración inicial', 'Concentración = 200 CFU/100mL');
%grid on;
