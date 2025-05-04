f = @(x) x + cos(x) .* e .^ (-10 .* x^2);
df = @(x) -20.* x .*  e .^ (-10 .* x^2) .* cos(x) - sin(x).* e .^ (-10 .* x^2);

tol = 1e-6;

[x, h] = newton(f, df, 0, 10000, tol);

disp(x);
