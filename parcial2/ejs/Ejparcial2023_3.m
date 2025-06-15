format long;

f = @(x) 2 + cos(pi * x);
df = @(x) pi * -sin(pi*x);
n = 3;
L = 40;
a = 0;
b = 2;

F = @(x) 2*pi.*f(x).*sqrt(1 + df(x).^2);

Q=cuad_gauss_c(F,a,b,L,n);

Q_exact = quad(F,a,b);

disp("CALCULADO");
disp(Q);

disp("EXACT");
disp(Q_exact);

