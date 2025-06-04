f = @(x) 4*x.^3 + 2*x -2;
df = @(x) 12*x.^2 + 2;

tol = 1e-4;

# mejor aprox al (1,0)
kmax = 10000;
x0 = 1;

[x, h] = newton(f, df, x0, kmax, tol)

disp(x);
disp(length(h)-1);
