format long; clc;

k0 = 0.57;
f1 = @(x) 12 .*cos(2 .* x);
cr = @(x) 5 * (x - 2);

ycd = 6;

% -40 = -k0 * u'
%  A*u'(b) + B*u(b) = C
rob = [-k0 0 -40];

%u'' = cr * u / k0 - f/k0
p = @(x) zeros(size(x));
q = @(x) cr(x) ./ k0;
r = @(x) -f1(x) ./k0;

f = @(x) [p(x), q(x), r(x)];
inter = [0 2];
h = 0.0001;
L = (inter(2)-inter(1))/h;

[x,y]=dif_fin_rob(f,inter,ycd,rob,L);

deriv0 = (y(2)-y(1))/h;
flujo0 = -k0 * deriv0;
disp(flujo0);

%% b
A = 0.01;
c= 0.217;
pp = 2.7;
Q = trapcomp(x,y);
E = Q*A*c*pp;
disp(E);

%% c
fc = @(x,y) [y(2); (cr(x)*y(1))/k0 - f1(x)/k0];
y0 = [6 20/k0];

[t,y]=rk4(fc, inter, y0, L);

disp(y(end,1));

flujo = -k0*y(end,2);
disp(flujo);


