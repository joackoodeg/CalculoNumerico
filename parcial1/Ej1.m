% ----- A ----

g= 9.8;
c = 15;
v = 35;
t = 5;

f = @(m)   g .* m .* (1- e .^( -1 .* (c ./ m) .* t) ) - (c .* v);

tol = 1e-5;
kmax = 1000;

[x_b, h_b] = biseccion(f, 0, 200, kmax, 1e-2);

[x, h] = secante(f, x_b - 0.5, x_b + 0.5, kmax, tol);

printf("X= %.5f", x);

% ----- B ----
m = 110;

g = @(c) g .* m .* (1- e .^( -1 .* (c ./ m) .* t) ) - (c .* v);

[x_b2, h_b2] = biseccion(g, 0, 200, kmax, 1e-2);

[x2, h2] = secante(g, x_b2 - 0.5, x_b2 + 0.5, kmax, tol);

printf("C= %.5f", x2);
