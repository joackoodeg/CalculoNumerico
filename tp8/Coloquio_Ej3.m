%% y'' = - 11/3 / x * y' + y(x)/x2 - ln(x) /x2 + 8/3 /x2

p = @(x) -(11/3) ./ x;
q = @(x) 1 ./ x  .^2;
r = @(x) -log(x)./x.^2 + 8/3 ./x.^2;

yc = [1 2.9735954];
inter = [1 4];
L = 10000;
f = @(x) [p(x), q(x), r(x)];

[x,y]=dif_fin_dir(f,inter,yc,L);

%% a
idx = find(x >= 2.5, 1);
disp(y(idx));

%%% b
h = x(2) - x(1);
deriv = (y(idx + 1) - y(idx - 1)) / (2 * h);
disp(deriv);

%% c
Q = trapcomp(x,y);
disp(Q);

