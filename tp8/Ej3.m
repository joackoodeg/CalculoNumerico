% Definición de funciones del ejercicio 2
f = @(x) [ -2./x, 2./x.^2, sin(log(x))./x.^2 ];
inter = [1, 2];
yc = [1, 2];

h = 0.01;
L = (inter(2) - inter(1)) / h;

% Resolviendo con disparo lineal
[x1, y1] = disparo_lineal(f, inter, yc, L);  % h = 0.01

% Resolviendo con diferencias finitas
[x2, y2] = dif_fin_dir(f, inter, yc, L);

% Solución exacta
c2 = (1/70)*(8 - 12*sin(log(2)) - 4*cos(log(2)));
c1 = 11/10 - c2;
y_exacta = @(x) c1.*x + c2./x.^2 - 0.3*sin(log(x)) - 0.1*cos(log(x));


ye1 = y_exacta(x1);
ye2 = y_exacta(x2);

error1 = max(abs(y1 - ye1));
error2 = max(abs(y2 - ye2));

% Resultados
fprintf("Error disparo lineal: %.5e\n", error1);
fprintf("Error dif finitas: %.5e\n", error2);

% Comparación gráfica
plot(x1, y1, 'b-', x2, y2, 'r--');
legend('Disparo lineal', 'Diferencias finitas');
title('Comparación de métodos');
xlabel('x'); ylabel('y');
grid on;

