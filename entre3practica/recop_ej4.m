x = linspace(-5,6,9);

y = @(x) log(x.^2 + 1) - exp(x/2) .* cos(pi * x);
df = @(x) (2*x)./(x.^2 + 1) + exp(x/2) .* (pi * sin(pi*x) - 0.5 * cos(pi*x));

df1 = df(-5);
dfn = df(6);

[a,b,c,d] = cubic_spline_clamped(x,y(x),df1,dfn); % IMPORTANTE : PASAR y(x) NO y

x_eval = linspace(-5,6,1000);

val = spline_eval(4.2, x, a, b, c, d);
dif = abs(val - y(4.2));
disp(dif);
