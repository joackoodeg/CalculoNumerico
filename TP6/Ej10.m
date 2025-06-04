% ej10.m
% Cálculo del área de superficie de revolución por distintos métodos

f = @(x) 20 .* x - (x.^3)/5;
df = @(x) 20 - (3*x.^2)/5;
g = @(x) 2 * pi .* f(x) .* sqrt(1 + (df(x)).^2);

% Cuadratura de Gauss con n = 3, L = 1
gauss_area = cuad_gauss_c(g, 0, 2, 1, 3);

% Regla de Simpson simple (n=3 puntos, un intervalo)
simpson_simple = (2 - 0)/6 * (g(0) + 4*g(1) + g(2));

% Trapecio compuesto con L = 5
L = 6;
x = linspace(0, 2, L+1);
y = g(x);
trap_area = trapcomp(x, y);

% Simpson compuesta con L = 5 (requiere n impar)
simpson_area = simpsoncomp(x, y);

% Método de referencia con quad
quad_area = quad(g, 0, 2);

% Mostrar resultados
fprintf("Cuadratura de Gauss (n=3): %.10f\n", gauss_area);
fprintf("Simpson simple:           %.10f\n", simpson_simple);
fprintf("Trapecio compuesto (L=5): %.10f\n", trap_area);
fprintf("Simpson compuesto (L=5):  %.10f\n", simpson_area);
fprintf("quad():                   %.10f\n", quad_area);
