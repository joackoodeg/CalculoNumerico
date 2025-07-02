format long; clc;

D = 0.2;
W1 = 2;
L = 6;
L1=4;
H=6e-3;
k=2.04;
uE = 40;
ycd = 200;

rob = [-k, -H, -H*uE];

% Define w(x) y P(x)
w = @(x) (D * W1 / L) * (L - x);
P = @(x) (2 * W1 / L) * (L - x) + 2 * D;

% Despejes estándar
p = @(x) -1 ./ (L - x);
q = @(x) (H / k) * (P(x) ./ w(x));
r = @(x) -q(x) * uE;

% Devuelve la función columna
f = @(x) [p(x), q(x), r(x)];

inter = [0 L1];
h = 0.01;
LL = (inter(2) - inter(1))/h;

[x,y]=dif_fin_rob(f,inter,ycd,rob,LL);

plot(x,y);

