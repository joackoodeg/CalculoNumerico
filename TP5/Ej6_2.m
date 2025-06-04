% Datos del problema
x = [1 2 3];
y = [0 4 22/3];

% Derivadas conocidas en los extremos
df1 = 3;   % f'(1)
dfn = 3;   % f'(3)

% Llamada a la función que calcula el trazador cúbico sujeto
[a, b, c, d] = cubic_spline_clamped(x, y, df1, dfn);

% Mostrar resultados
printf("Polinomio S0(x) para 1 <= x < 2:\n");
printf("S0(x) = %.4f + %.4f*(x - 1) + %.4f*(x - 1)^2 + %.4f*(x - 1)^3\n", a(1), b(1), c(1), d(1));

printf("\nPolinomio S1(x) para 2 <= x <= 3:\n");
printf("S1(x) = %.4f + %.4f*(x - 2) + %.4f*(x - 2)^2 + %.4f*(x - 2)^3\n", a(2), b(2), c(2), d(2));

