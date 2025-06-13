format long;

x = linspace(-5,6,9);

y = @(x) log(x.^2 + 1) - exp(x/2) .* cos(pi * x);

df = @(x) (2*x)./(x.^2 + 1) + exp(x/2) .* (pi * sin(pi*x) - 0.5 * cos(pi*x));

df1 = df(-5);
dfn = df(6);

[S,dS,ddS]=funcion_spline(x,y(x), df1, dfn);

%%% a)
y_exact = y(4.2);
err = abs(S(4.2) - y_exact);
disp(err);

%%% b)

%% Primero con
%% xx = linspace(-5,6,1000);

%% ya se que es: 4.084084084084084
%% asi que hago entonces
%% xx = linspace(4,4.5,1e5);

xx = linspace(4,5,1e6);
yy = S(xx);
[max_val, idx_max] = max(yy);
x_max = xx(idx_max);

disp(x_max);
disp(max_val);

