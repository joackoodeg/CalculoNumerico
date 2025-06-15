format long;

f = @(x) 1 + x + cos(x);
df= @(x) 1 -sin(x);
F = @(x) 2 * pi * f(x) .* sqrt(1 + df(x).^2);

L=10; n=3;
area_exact = quad(F,0,4);
area = cuad_gauss_c(F,0,4,L,n);

printf("area exacta= %.9f", area_exact);
printf("area calculada= %.9f", area);
