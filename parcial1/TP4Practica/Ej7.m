% Definimos la función y su derivada
f = @(x) x .* (log(x + 3) - 17) - 1;
df = @(x) log(x + 3) - 17 + x ./ (x + 3);

kmax = 10000;

a = 0;
b = 1;

while f(a) * f(b) > 0
  b = b * 2;
endwhile

[x_b, h_b] = biseccion(f, a, b, kmax, 1e-2);

[x, h] = newton(f, df, x_b, kmax, 1e-12);

printf("x= %.12f", x);


