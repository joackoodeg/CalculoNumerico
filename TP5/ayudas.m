% c ) Errores cuadráticos
v_ajuste_a = M * c;
ECM_a = mean((v - v_ajuste_a).^2);

v_ajuste_b = polyval(p, t);
ECM_b = mean((v - v_ajuste_b).^2);

%Sin mean:
err = sum((y - polyval(p,x)).^2)/n;

%% distancia recorrida
if ECM_a < ECM_b
    f_dist = @(t) c(1)*sin(2*t) + c(2)*t.^2 + c(3)*t.^3 + c(4);
else
    f_dist = @(t) polyval(p, t);
endif

% Integración numérica para hallar distancia
dist = quad(f_dist, 0, 6);  % integral de la velocidad
printf("\n(d) Distancia recorrida en las primeras 6 horas: %.4f km\n", dist);

%% METODOS 11
1 -
x = []
y = []
M = [f1' f2' f3']

c = M \ y'

2 -
x = []'
y = []'
M = [f1 f2 f3]

A = M' * M
b = M' * y
c = A \ b

