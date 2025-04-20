x = linspace(-pi, pi, 1000);
f = cos(x);

% (a)
g1 = 1;
figure(); % "Abrí una nueva figura (ventana) y dibujá este gráfico ahí
plot(x, f, x, g1 * ones(size(x)));
title('Ejercicio 3 (a)');
legend('cos(x)', '1');

% (b)
g2 = 1 - x.^2 / factorial(2);
figure();
plot(x, f, x, g2);
title('Ejercicio 3 (b)');
legend('cos(x)', '1 - x^2/2!');

% (c)
g3 = 1 - x.^2 / factorial(2) + x.^4 / factorial(4);
figure();
plot(x, f, x, g3);
title('Ejercicio 3 (c)');
legend('cos(x)', '1 - x^2/2! + x^4/4!');

% (d)
g4 = 1 - x.^2 / factorial(2) + x.^4 / factorial(4) - x.^6 / factorial(6);
figure();
plot(x, f, x, g4);
title('Ejercicio 3 (d)');
legend('cos(x)', '1 - x^2/2! + x^4/4! - x^6/6!');

% PLOT:
% plot(x, f, x, g)
% Esto grafica dos curvas en la misma figura:
% x vs f (la función cos(x)).
% x vs g (el polinomio de Taylor correspondiente).

% Con estilos:
% plot(x, f, 'b-', x, g, 'r--')
% b-' → línea azul sólida (b = blue, - = línea sólida)
%'r--' → línea roja punteada (r = red, -- = guiones)
