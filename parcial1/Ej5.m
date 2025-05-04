f = @(x) sin(x) + cos(1 + x .^ 2) - 1;

t = linspace(0,10,1000);
figure();
plot(t,f(t));
grid on;
axis([7 8 -1 1]);

df = @(x) cos(x) - sin(1 + x^2 )* 2 .* x;

tol = 1e-10;

[x_b, h_b] = biseccion(f, 7.8, 8, 10000, tol);

[x_n, h_n] = newton(f, df, x_b, 10000, tol);

printf("x= %.10f", x_n);
