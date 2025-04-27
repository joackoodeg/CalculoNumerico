a= 0.401;
b= 42.7e-6;
N = 1000;
T = 300;
p = 3.5e7;
k = 1.3806503e-23;

f = @(V) (p + a*(N/V)^2)*(V - N*b) - k*N*T;
df = @(V) p + a*((N^2)/(V^2) - 2*(N^2)*(V-N*b)/(V^3));

kmax = 10000;

tol = 1e-12;

xmin =0;
xmax = 1;

[x_b, h_b] = biseccion(f, xmin, xmax, kmax, tol)

x0 = x_b;

[x_n, h_n] = newton(f, df, x0, kmax, tol)

disp(x_n);
