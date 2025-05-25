x = linspace(-5,6,9);

y = @(x) log(x.^2 + 1) - exp(x/2) .* cos(pi * x);
df = @(x) (2*x)./(x.^2 + 1) + exp(x/2) .* (pi * sin(pi*x) - 0.5 * cos(pi*x));

df1 = df(-5);
dfn = df(6);

[a,b,c,d] = cubic_spline_clamped(x,y(x),df1,dfn); % IMPORTANTE : PASAR y(x) NO y

val = spline_eval(4.2, x, a, b, c, d);
disp(val);
dif = abs(val - y(4.2));
disp(dif);


% b )
% Primero se busca con linspace(-5,6,1000);
% Luego de encontrar el valor se hace el paso mas chico 1e5
% Ahora se encuentra el valor con la tolerancia mencionada

x_eval = linspace(4,5,1e5);
yy = spline_eval(x_eval, x, a, b, c, d);
[max_val, idx_max] = max(yy);
x_max = x_eval(idx_max);

printf("(b) Máximo del spline:\n");
printf("x = %.5f\n", x_max);
printf("máximo = %.5f\n", max_val);
