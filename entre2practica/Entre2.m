clc;

%a)

K = 0.04;
pt=3.5;
f = @(x) ((x./(1-x)).*sqrt((2*pt)./(2+x))) - K;

xmin=-0.5;
xmax=0.5;
kmax=1000;
tol=1e-8;

[x_sa, h_sa] = secante(f, xmin, xmax, kmax, tol)

printf('x= %.8f', x_sa);

%b)
x=0.02;
g = @(p) ((x./(1-x)).*sqrt((2*p)./(2+x))) - K;

tol=1e-2;
[x_sb, h_sb] = secante (g, 2, 4, kmax, tol);

printf('p= %.2f', x_sb);
