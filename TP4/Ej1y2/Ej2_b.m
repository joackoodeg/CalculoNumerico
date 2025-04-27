% Definimos las funciones g1 y g2
g1 = @(x) 0.5 * sqrt(10 - x^3);
g2 = @(x) sqrt(10 / (4 + x));

% Parámetros
x0 = 1.5;
tol = 1e-3;
kmax = 100;

% Ejecutamos punto fijo para g1
[x1, h1] = puntofijo(g1, x0, kmax, tol);
fprintf('g1 convergió a x = %.6f en %d iteraciones.\n', x1, length(h1)-1);

% Ejecutamos punto fijo para g2
[x2, h2] = puntofijo(g2, x0, kmax, tol);
fprintf('g2 convergió a x = %.6f en %d iteraciones.\n', x2, length(h2)-1);

