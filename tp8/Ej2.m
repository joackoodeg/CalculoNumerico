f = @(x) [-2 ./ x, 2 ./ x.^2, sin(log(x))./ x.^2]; % p q r
inter = [1 2];

yc = [1 2]; % cond iniciales

h1 = 0.1;
L1 = (inter(2) - inter(1)) / h1;
[x1, y1] = disparo_lineal(f, inter, yc, L1);

h2 = 0.01;
L2 = (inter(2) - inter(1)) / h2;
[x2, y2] = disparo_lineal(f, inter, yc, L2);


% Solución exacta
c2 = (1/70)*(8 - 12*sin(log(2)) - 4*cos(log(2)));
c1 = 11/10 - c2;
y_exacta = @(x) c1.*x + c2./x.^2 - 0.3*sin(log(x)) - 0.1*cos(log(x));

ye1 = y_exacta(x1);
ye2 = y_exacta(x2);

error1 = max(abs(y1 - ye1));
error2 = max(abs(y2 - ye2));
orden = log2(error1 / error2);

% Resultados
fprintf("Error con h = 0.1: %.5e\n", error1);
fprintf("Error con h = 0.01: %.5e\n", error2);
fprintf("Orden empírico del método: %.2f\n", orden);

% Gráfico
plot(x2, y2, 'b-', x2, y_exacta(x2), 'r--');
legend('Aproximada', 'Exacta');
xlabel('x'); ylabel('y(x)');
title('Método del Disparo Lineal con RK4');
grid on;
