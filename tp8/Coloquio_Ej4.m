%% -2x * y' + y'' * (1-x2) + 42y = 0
%% y'' * (1-x2) = -42y + 2x*y'
%% y'' = -42y / (1-x2)+ 2x*y' / (1-x2)

format long;

p = @(x) (2*x) ./ (1 - x.^2);
q = @(x) -42 ./ (1 - x.^2);
r = @(x) zeros(size(x));

f = @(x) [p(x), q(x), r(x)];

inter = [-1, 1];
yc = [1, 1];

L = 10000;

[x,y]=dif_fin_dir(f,inter,yc,L);

idx = find(x >= 0, 1);
disp(y(idx));

p = polyfit(x,y,6);
disp(polyout(p, 'x'));

t = linspace(0,1, 1000);
pp = polyval(p,t);
plot(t,pp); hold on;

poly_func = @(t) polyval(p, t);

kmax = 10000;
tol = 1e-9;

[x1, h1] = secante(poly_func, 0.18, 0.25, kmax, tol);
[x2, h2] = secante(poly_func, 0.6, 0.7, kmax, tol);
[x3, h3] = secante(poly_func, 0.9, 1, kmax, tol);

disp(x1); disp(x2); disp(x3);
