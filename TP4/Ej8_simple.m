E = @(t) ((t + 1/3)^3 + 1/3) * exp(-t);

% Derivada de E(t)
dE = @(t) (3*(t + 1/3)^2 * exp(-t)) - (((t + 1/3)^3 + 1/3) * exp(-t));

% Segunda derivada de E(t)
d2E = @(t) (6*(t + 1/3) - 3*(t + 1/3)^2 - 3*(t + 1/3)^2 + ((t + 1/3)^3 + 1/3)) .* exp(-t);

tol = 1e-5;
kmax = 100;

%% Inciso (a) - Resolver E(t) = 1.5
f1 = @(t) E(t) - 1.5;
% Elección: Bisección por robustez
t1 = biseccion(f1, 0, 5, kmax, tol);  % Ajustar intervalo si se quiere otra raíz
fprintf('Inciso (a): E(t) = 1.5 en t = %.5f\n', t1);

%% Inciso (b) - Máxima energía
% Buscamos la raíz de la derivada: dE/dt = 0
t2 = newton(dE, d2E, 0.5, kmax, tol);  % Valor inicial estimado
fprintf('Inciso (b): Máxima energía E(t) = %.5f ocurre en t = %.5f\n', E(t2), t2);

%% Inciso (c) - Máxima tasa de crecimiento -> máximo de |dE/dt|
% Buscamos máximo de |dE(t)|, que equivale a buscar raíz de d²E/dt²
f3 = @(t) d2E(t);
t3 = newton(f3, @(t) (6 - 12*(t + 1/3) + 3*(t + 1/3)^2) .* exp(-t) - d2E(t), 0.5, kmax, tol);
fprintf('Inciso (c): Máxima tasa de crecimiento instantánea ocurre en t = %.5f con dE/dt = %.5f\n', t3, dE(t3));
