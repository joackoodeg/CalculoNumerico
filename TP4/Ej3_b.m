% Definimos cada gi
g1 = @(x) (3 + x - 2*x.^2).^(1/4);
g2 = @(x) sqrt((x + 3 - x.^4) / 2);
g3 = @(x) sqrt((x + 3) ./ (x.^2 + 2));
g4 = @(x) (3*x.^4 + 2*x.^2 + 3) ./ (4*x.^3 + 4*x - 1);

% Parámetros
p0 = 1;
kmax = 100;
tol = 1e-5;

% Aplicamos punto fijo a cada uno
[x1, h1] = puntofijo(g1, p0, kmax, tol);
[x2, h2] = puntofijo(g2, p0, kmax, tol);
[x3, h3] = puntofijo(g3, p0, kmax, tol);
[x4, h4] = puntofijo(g4, p0, kmax, tol);

% Mostramos resultados
disp('g1: '); disp([x1, length(h1)]);
disp('g2: '); disp([x2, length(h2)]);
disp('g3: '); disp([x3, length(h3)]);
disp('g4: '); disp([x4, length(h4)]);
