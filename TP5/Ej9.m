% Datos originales
x = [-1; 0; 1; 2];
y = [-1.1; -0.4; -0.9; -2.7];

% Transformar: Y = ln(-y)
Y = log(-y);

% Ajustar con polyfit (grado 2)
coef = polyfit(x, Y, 2);

a = coef(1);
b = coef(2);
c = coef(3);

fprintf("Coeficientes obtenidos con polyfit:\n");
fprintf("a = %.6f\n", a);
fprintf("b = %.6f\n", b);
fprintf("c = %.6f\n", c);

# Obtener el polinomio
disp("Polinomio formado: ");
disp(polyout(coef, 'x'));

% Gráfico
xg = linspace(-1.5, 2.5, 200);
yg = -exp(a * xg.^2 + b * xg + c);

figure();
plot(xg, yg, 'b-', 'LineWidth', 2); hold on;
plot(x, y, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
xlabel('x'); ylabel('y');
legend('Curva ajustada', 'Datos originales');
title('Ajuste con polyfit: f(x) ≈ -exp(ax^2 + bx + c)');
grid on;

