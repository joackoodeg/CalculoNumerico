% Datos
x = [0.0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0];
y = [4.24 4.44 4.91 5.44 5.65 5.33 3.91 1.86 0.07 -1.16 -1.94];

% Calcular cos(pi*x/2) y su cuadrado
u1 = cos(pi * x / 2);
u2 = u1 .^ 2;

% Matriz de diseño
X = [ones(size(x')) u1' u2'];

% Resolver sistema por mínimos cuadrados
a = X \ y';

% Mostrar los coeficientes con 2 decimales
printf("a0 = %.2f\n", a(1));
printf("a1 = %.2f\n", a(2));
printf("a2 = %.2f\n", a(3));

