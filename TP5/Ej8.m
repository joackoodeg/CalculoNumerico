x = [0 1 2 3 4 5 6];
y = [432 599 1012 1909 2977 4190 5961];
p6 = polyfit(x, y, 6);  % Polinomio interpolante de grado 6

%% b
p1 = polyfit(x, y, 1);  % Aproximación lineal

%% c
p2 = polyfit(x, y, 2);  % Aproximación cuadrática

%%% grafica
xx = linspace(0, 6, 200);
plot(x, y, 'ko', 'MarkerFaceColor','k'); hold on;
plot(xx, polyval(p6, xx), 'b', 'LineWidth', 1.5);  % p6
plot(xx, polyval(p1, xx), 'r--', 'LineWidth', 1.5);  % p1
plot(xx, polyval(p2, xx), 'g-.', 'LineWidth', 1.5);  % p2
legend('Datos', 'Interpolante grado 6', 'Modelo lineal', 'Modelo cuadrático');
xlabel('Semana'); ylabel('Cantidad de mosquitos'); grid on;
title('Modelos de crecimiento de mosquitos');

%%% d error
e_p6 = norm(polyval(p6, x) - y);
e_p1 = norm(polyval(p1, x) - y);
e_p2 = norm(polyval(p2, x) - y);

%%% e
x10_p6 = polyval(p6, 10);
x10_p1 = polyval(p1, 10);
x10_p2 = polyval(p2, 10);

%% f
real = 14900;
err6 = abs(x10_p6 - real)/real;
err1 = abs(x10_p1 - real)/real;
err2 = abs(x10_p2 - real)/real;


%% Mostrar resultados del Ejercicio 8
disp('==================== Ejercicio 8 ====================');

%% a) Coeficientes del polinomio interpolante de grado 6
disp(' ');
disp('a) Polinomio interpolante de grado 6 (p6):');
disp(p6);

%% b) Modelo lineal por mínimos cuadrados
disp(' ');
disp('b) Modelo lineal (p1):');
disp(p1);

%% c) Modelo cuadrático por mínimos cuadrados
disp(' ');
disp('c) Modelo cuadrático (p2):');
disp(p2);

%% d) Errores cuadráticos
disp(' ');
disp('d) Error cuadrático de cada modelo:');
fprintf('   - Interpolante grado 6: %.4f\n', e_p6);
fprintf('   - Modelo lineal:        %.4f\n', e_p1);
fprintf('   - Modelo cuadrático:    %.4f\n', e_p2);

%% e) Predicciones para semana 10
disp(' ');
disp('e) Predicción de cantidad de mosquitos para semana 10:');
fprintf('   - Interpolante grado 6: %.4f\n', x10_p6);
fprintf('   - Modelo lineal:        %.4f\n', x10_p1);
fprintf('   - Modelo cuadrático:    %.4f\n', x10_p2);

%% f) Error relativo en la predicción (valor real = 14900)
disp(' ');
disp('f) Error relativo respecto a la medición real (14900):');
fprintf('   - Interpolante grado 6: %.4f (%.2f%%)\n', err6, err6*100);
fprintf('   - Modelo lineal:        %.4f (%.2f%%)\n', err1, err1*100);
fprintf('   - Modelo cuadrático:    %.4f (%.2f%%)\n', err2, err2*100);

disp('=======================================================');

