format long;

x = [-1 1 2 3 4]';
y = [0.23 0.25 0.26 0.14 0.06]';

z = 1 ./ y;

f1 = exp(x);
f2 = x;
f3 = ones(size(x)); % para el término constante (7.5/a)

M = [f1, f2, f3];

% Resolver mínimos cuadrados
c = M \ z;

% c = [alpha; beta; gamma]
a = 7.5 / c(3);
b = a * c(1);
cc = a * c(2);  % c ya está usado como vector de coef.

% Mostrar
printf("a = %.7f\n", a);
printf("b = %.8f\n", b);
printf("c = %.7f\n", cc);

%%% b)

xx = [-1 1 2 3 4];
yy = [0.23 0.25 0.26 0.14 0.06];

[S, dS, ddS] = funcion_spline(xx, yy);

y_interp = S(0);

printf("b) : %.7f\n", y_interp);

%%% c)
f_mc_0 = a / (b * exp(0) + cc * 0 + 1);  % porque 1 = c(3) * a = a / c(3)
disp("test");
disp(f_mc_0);

y_real = 0.23;
printf("error minimo cuadrados: ");
err_mc = abs((y_real -f_mc_0)/y_real);
printf("\n %.4f", err_mc);

printf("\n error spline cubico: ");
err_sc = abs((y_real - y_interp)/y_real);
printf("\n %.6f", err_sc);
