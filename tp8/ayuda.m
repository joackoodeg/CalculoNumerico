% Define w(x) y P(x)
w = @(x) (D * W1 / L) * (L - x);
P = @(x) (2 * W1 / L) * (L - x) + 2 * D;

% Despejes estándar
p = @(x) -1 ./ (L - x);
q = @(x) (H / k) * (P(x) ./ w(x));
r = @(x) -q(x) * uE;

% Devuelve la función columna
f = @(x) [p(x), q(x), r(x)];

% Parámetros físicos
H = 6e-3;      % coef. convección
k = 2.04;      % conductividad
D = 0.2;       % profundidad
W1 = 2;        % ancho base
L = 6;         % largo total
uE = 40;       % temperatura externa

