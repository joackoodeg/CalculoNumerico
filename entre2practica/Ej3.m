g1 = @(x) (3 + x - 2*x.^2).^(1/4);
g2 = @(x) sqrt((x+3-x.^4) ./ 2);
g3 = @(x) sqrt((x+3) ./ (x.^2 + 2));
g4 = @(x) (3*x.^4 + 2*x.^2 + 3) ./ (4*x.^3 + 4*x -1);

p0=1;
kmax = 1000;
tol = 1e-5;

[x1, h1] = puntofijo(g1, p0, kmax, tol);



