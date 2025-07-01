ycd = 6;

%% -0.9 * u'' + (1.05x + 2)*u = 5x(5-x);
%% -0.9 * u'' = 5x(5-x)  - (1.05x + 2)*u ;
%%  u'' = -5x(5-x)/0.9 + (1.05x + 2)*u/0.9;

%% p = 0
%% q = (1.05x + 2)/0.9
%% r =  5x(5-x)/-0.9

k0 =0.9;
cr = @(x) (1.05 .* x + 2)./k0;
f1 = @(x) -(5 .* x .* (5 - x))./ k0;
f = @(x) [0 .* x, cr(x), f1(x)];

%% conficin de contorno:

% izq: ycd = 6;
% der:  -0.9* u' = 15*(u - 4);
% A y'(b) + B y(b) = C
rob = [-0.9 , -15, -60];

inter = [0 5];
h = 0.001;
L = (inter(2) - inter(1))/h;

[x,y]=dif_fin_rob(f,inter,ycd,rob,L);

plot(x,y);

%% Temperatura en punto medio:
% Metodo 1:
idx = find (x >= 2.5);
disp(y(idx(1)));

%% metodo 2:
[~, idx_medio] = min(abs(x - 2.5));
disp(y(idx_medio));

