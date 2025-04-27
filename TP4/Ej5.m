% Definimos la función g(x) y su derivada g'(x)
g = @(x) 4*x.^3 + 2*x - 2;
dg = @(x) 12*x.^2 + 2;

% Condiciones
x0 = 1; % buena aproximación inicial, cerca de 1
tol = 1e-4; % tolerancia absoluta
kmax = 100; % máximo número de iteraciones

% Método de Newton
[x_aprox, h] = newton(g, dg, x0, kmax, tol);

fprintf('La aproximación del valor de x es: %.5f\n', x_aprox);
fprintf('Número de iteraciones: %d\n', length(h)-1); % . Estamos restando 1 para no contar el valor inicial como una iteración.

