format long;

f = @(x) log(x .^ 2 + 1) - exp(x ./ 2) .* cos(pi .* x) - 1.106;

%% a

t = linspace(-6,6,1000);

%grafiacar para ver raices
figure();
plot(t,f(t));
axis([-6 6 -0.1 0.1]);
grid on;

%% b

tol = 1e-7;
[x, h] = biseccion(f, -1, 0, 10000, tol);
printf("raiz= %.7f\n", x);
it = length(h);
printf("iteraciones= %d\n", it);

%% c

df = @(x) (2 .* x) ./ (x.^2 + 1) - (0.5 .* exp(x./2) .* cos(pi .* x) - pi .* exp(x./2) .* sin(pi .* x));
tol_n = 1e-10;

[x_1, h_1] = newton(f, df, 3, 10000, tol_n);
printf("c-1= %.10f\n", x_1);

[x_2, h_2] = newton(f, df, 3.05, 10000, tol_n);
printf("c-2= %.10f\n", x_2);

[x_3, h_3] = newton(f, df, 3.1, 10000, tol_n);
printf("c-3= %.10f\n", x_3);

%%% d
y_idem = @(x) x;

%% grafica para ver:
%figure();
%plot(t,y_idem(t),t,f(t));
%axis([0 1 -1 1]);
%grid on;

f_pf = @(x) log(x .^ 2 + 1) - exp(x ./ 2) .* cos(pi .* x) - 1.106 - x;

[x_pf, h_pf] = secante(f_pf, 0.8, 1, 10000, 1e-7);
printf("Punto fijo= %.7f\n", x_pf);






