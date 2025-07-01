clc;
format long;

k0=1;
inter = [0 3];
h = 0.01;
L = (inter(2)-inter(1))/h;

% u(L) = B -> u(0) = 21
ycd = 21;

% derecho aislado -> u′(L)=0 -> u′(3)=0
% Condición de contorno derecha (Robin): A y'(b) + B y(b) = C
% Para u'(3) = 0
rob = [1 0 0];

% K0u′′(x) = f1 (x)
% −(1)* u′′(x)=20⋅sin(5(x−1))
% -u′′(x) + 0 * u′(x) + 0 * u(x) =20⋅sin(5(x−1))
% u′′(x) = - 20⋅sin(5(x−1))
% p = 0,  q = 0, r = -20sin(5(x-1))

f1 = @(x) -20 .* sin(5 .* (x-1));

f = @(x) [0 .* x, 0 .* x , f1(x)];

[x,y]=dif_fin_rob(f,inter,ycd,rob,L);

plot(x,y);

disp("temperatura al final de la barra");
disp(y(end));

[t_max, idx] = max(y);
disp("temperatura maxima");
disp(t_max);
disp("en: x=");
disp(x(idx));


