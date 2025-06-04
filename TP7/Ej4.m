f = @(t,y) t.*exp(3*t) - 2*y;
dfdy = @(t,y) -2;  % derivada parcial de f con respecto a y
y_exacta = @(t) (t.*exp(3*t))/5 - exp(3*t)/25 + exp(-2*t)/25;

hs = [0.2, 0.1, 0.05];
errores_euler = [];
errores_cn = [];

for i = 1:length(hs)
    h = hs(i);
    L = (1 - 0)/h;

    [t1, y1] = euler(f, [0 1], 0, L);
    [t3, y3] = CN_newton(f, dfdy, 0, 1, 0, L);

    ye = y_exacta(t1);

    err_euler = max(abs(ye - y1));
    err_cn = max(abs(ye - y3));

    errores_euler(i) = err_euler;
    errores_cn(i) = err_cn;
end

% Mostrar resultados
fprintf('h\tEuler\tCrank-Nicholson\n');
for i = 1:length(hs)
    fprintf('%.2f\t%.5e\t%.5e\n', hs(i), errores_euler(i), errores_cn(i));
end

