inter = [0 2];
A = 0.01;
c = 0.217;
pp = 2.7;
k0 = 0.57;
ue = 4;
H = 10;

f1 = @(x) 12 * cos(2*x);
cr = @(x) 5 * (x-2);

ycd = 6;

% obtener rob
% % A y'(b) + B y(b) = C
% -k0 u' = h u - h ue
%  A = -k0
%  B = -H
%  c = -H * ue
rob = [-k0 -H -H*ue];

% Obtener F del PVC
% u'' = cr * u / k0 - f/-k0

p = @(x) zeros(size(x));
q = @(x) cr(x)/k0;
r = @(x) -f1(x)/k0;

F = @(x) [p(x), q(x), r(x)];

% paso
h  = 0.001;
L = (inter(2)-inter(1))/h;

[x,y]=dif_fin_rob(F,inter,ycd,rob,L);

printf("temp der: %.4f\n", y(end));

%% b
deriv_der = (y(end) - y(end-1)) /h;
flujo = -k0 * deriv_der;
printf("flujo der: %.5f\n", flujo);

%% c
Q = trapcomp(x,y);

E = A*c*pp*Q;

printf("energia: %.10f\n", E);


%%% d

% -k0*u' = -48
%  u' = 48/k0

y0 = [6 48/k0];

%% reduccion de orden

%u'' = cr * u / k0 - f/-k0


fd = @(x,y)[y(2); (cr(x) * y(1) )/ k0 - f1(x)/k0];

[td,yd]=rk4(fd, inter, y0, L);

printf("temperatura en el otro ext= %.6f\n", (yd(end,1)));


