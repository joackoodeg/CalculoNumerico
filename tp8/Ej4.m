% Definición del problema
f = @(x) [-2./x, 2./x.^2, sin(log(x))./x.^2];
inter = [1, 2];
ycd = 1;
rob = [1, 1, 2.5];
L = 100;

% Solución exacta
c2 = (1/70)*(8 - 12*sin(log(2)) - 4*cos(log(2)));
c1 = 11/10 - c2;
y_exacta = @(x) c1.*x + c2./x.^2 - 0.3*sin(log(x)) - 0.1*cos(log(x));

% Soluciones numéricas
[x_rob, y_rob] = dif_fin_rob(f, inter, ycd, rob, L);
yc = [1, 2];
[x_dir, y_dir] = dif_fin_dir(f, inter, yc, L);
[x_dis, y_dis] = disparo_lineal(f, inter, yc, L);  % Método del disparo (Dirichlet)

% Solución exacta en los mismos puntos
y_exact_dir = y_exacta(x_dir);

%% errores
error_dir = max(abs(y_dir - y_exact_dir));
error_dis = max(abs(y_dis - y_exacta(x_dis)));
error_rob = max(abs(y_rob - y_exacta(x_rob)));

fprintf("Error máximo (Diferencias Dirichlet): %.2e\n", error_dir);
fprintf("Error máximo (Disparo Lineal): %.2e\n", error_dis);
fprintf("Error máximo (Diferencias Robin): %.2e\n", error_rob);


% Gráfica comparativa
figure;
plot(x_dir, y_dir, 'b-', 'LineWidth', 1.5); hold on;
plot(x_rob, y_rob, 'r--', 'LineWidth', 1.5);
plot(x_dis, y_dis, 'g-.', 'LineWidth', 1.5);
plot(x_dir, y_exact_dir, 'k:', 'LineWidth', 2);

legend('Dirichlet (Diferencias Finitas)', ...
       'Robin (Diferencias Finitas)', ...
       'Dirichlet (Disparo Lineal)', ...
       'Solución Exacta', ...
       'Location', 'Best');

xlabel('x'); ylabel('y(x)');
title('Comparación de métodos y condiciones de contorno');
grid on;

