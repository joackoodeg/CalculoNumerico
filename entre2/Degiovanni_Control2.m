t = 0.02;

z = @(a) 0.04 .* (sqrt(a+t).*(1-t) )- (t .*sqrt(3*a)) -t;
%%% PASAR T RESTANDO!!
tol = 1e-6;
kmax=1000;

[x_a, h_a] = secante(z, 18.5, 25.5, kmax, tol);

printf("x_a = %.6f", x_a);

a=x_a;

w = @(t) 0.04 .* (sqrt(a+t).*(1-t) )- (t .*sqrt(3*a));

c = linspace(-20,20,10000);

plot(c,w(c));

xmin = 0.1;
xmax = 0.3;

[x_b, h_b] = secante(w, xmin, xmax, kmax, tol);

disp(x_b);

printf("x_b= %.6f", x_b);

