format long;

f = @(x) 2 + cos(pi*x);
df = @(x) -pi*sin(pi*x);
g = @(x) 2 * pi .* f(x) .* sqrt(1 + (df(x)).^2);

% L = subintervalos
Q = cuad_gauss_c(g,0,2,40,3);
disp(Q);
