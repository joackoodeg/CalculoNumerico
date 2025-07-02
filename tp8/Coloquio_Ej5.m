inter = [0 2];
A = 0.01;
c = 0.217;
pp = 2.7;
k0 = 0.57;
ue = 4;
H = 15;

f1 = @(x) 2 .* x .* (2-x);
cr = @(x) 0.1 .* x .^3 + 2.5;

ycd = 6;

% A y'(b) + B y(b) = C
rob = [-k0 -H -H*ue];

p = @(x) zeros(size(x));
q = @(x) cr(x)/k0;
r = @(x) -f1(x)/k0;

% u'' = cr * u / k0 - f/-k0
F = @(x) [p(x), q(x), r(x)];
h  = 0.001;
L = (inter(2)-inter(1))/h;

[x,y]=dif_fin_rob(F,inter,ycd,rob,L);

printf("temp der: %.4f\n", y(end));

%%% b
deriv_der = (y(end) - y(end-1)) /h;
flujo = -k0 * deriv_der;
printf("flujo der: %.5f\n", flujo);


%%% c
Q = trapcomp(x,y);

E = A*c*pp*Q;

printf("energia: %.10f\n", E);


