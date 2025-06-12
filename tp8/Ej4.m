f = @(x) [ -2./x, 2./x.^2, sin(log(x))./x.^2 ];
inter = [1, 2];
ycd = 1;
rob = [1, 1, 2.5];
L = 100;

[x_rob, y_rob, ~] = dif_fin_rob(f, inter, ycd, rob, L);

% También comparamos con diferencias finitas Dirichlet del Ejercicio 3
yc = [1, 2];
[x_dir, y_dir, ~] = dif_fin_dir(f, inter, yc, L);

[x1, y1] = disparo_lineal(f, inter, yc, L);  % h = 0.01

% Gráfica comparativa
plot(x_dir, y_dir, 'b-', x_rob, y_rob, 'r--', x1, y1, 'g');
legend('Condición Dirichlet', 'Condición Robin');
xlabel('x'); ylabel('y'); grid on;
title('Comparación entre condiciones de contorno');
