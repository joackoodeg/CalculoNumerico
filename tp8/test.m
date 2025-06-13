f = @(x) [0.*x, 0.*x, 0.*x];  % y'' = 0
inter = [0, 1];
ycd = 1;
rob = [1, 1, 2];  % y'(1) + y(1) = 2
L = 100;

[x, y] = dif_fin_rob(f, inter, ycd, rob, L);
plot(x, y); grid on;

