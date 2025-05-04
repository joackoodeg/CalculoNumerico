format long;

t = 0.02;

z = @(a) 0.04 .* (sqrt(a+t).*(1-t) )- (t .*sqrt(3*a)) -t;

x_o = fzero(z,19);

printf("x_o = %.6f", x_o);


tol = 1e-6;
kmax=1000;

[x_a, h_a] = secante(z, 18, 20, kmax, tol);

printf("x_a = %.6f", x_a);

a=x_a;

w = @(t) 0.04 .* (sqrt(a+t).*(1-t) )- (t .*sqrt(3*a));

c = linspace(-1,1,10000);

figure();
plot(c,w(c));
axis([-0.1 0.1 -1 1]);
grid on;

xmin = 0.1;
xmax = 0.3;

[x_b, h_b] = secante(w, xmin, xmax, kmax, tol);

disp(x_b);


printf("x_b= %.6f", x_b);
