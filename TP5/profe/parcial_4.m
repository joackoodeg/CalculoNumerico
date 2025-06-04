x = linspace(-5,6,9);

y = @(x) log(x.^2 + 1) - exp(x/2) .* cos(pi * x);
df = @(x) (2*x)./(x.^2 + 1) + exp(x/2) .* (pi * sin(pi*x) - 0.5 * cos(pi*x));

df1 = df(-5);
dfn = df(6);

[s, ds, dds] =funcion_spline(x,y(x),df1,dfn);
%disp("error");
%err = abs(y(4.2)- s(4.2));
%disp(err);

%%
yy= y(x);
[max_val, max_idx] = max(yy);
disp(max_val);
