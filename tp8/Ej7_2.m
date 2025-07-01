ycd = 200;

% -2.04 * u'(L1) = 6e-3 * (u(L1) - 40);
% -2.04 * u'(L1)  -6e-3 * (u(L1)= - 6e-3 * 40;
% A y'(b) + B y(b) = C

rob = [-2.04, -6e-3, -6e-3*40];

D = 0.2;
W1 = 2;
L = 6;
L1=4;
H=6e-3;
k=2.04;

w = @(x) (D*W1/L)*(L-x);

% w * u'' - w*u' = H/k * 2 * (w + D) * (u - 40)
% w * u'' - w*u' = H/k * 2 * (w + D) * (u - 40)
% w * u'' - w*u' = H/k * 2 * (w + D) * (u) - 40 * H/k * 2 * (w + D)
% u'' = -*u + H/k *(w + 2*D) * (u) - 40 * H/k * 2 * (w + D);

w = @(x) (D*W1/L)*(L - x);
P = @(x) (2*W1/L)*(L - x) + 2*D;

p = @(x) -1 ./ (L - x);
q = @(x) (H/k) * (P(x) ./ w(x));
r = @(x) -q(x) * uE;

f = @(x) [p(x), q(x), r(x)];

inter = [0 L1];
h = 0.01;
LL = (inter(2) - inter(1))/h;

[x,y]=dif_fin_rob(f,inter,ycd,rob,LL);

plot(x,y);

%%% b
% Flujo de calor en x = 0
A1 = D * W1;        % Área en x=0
u1 = y(2);          % Primer nodo interno
uw = y(1);          % Temperatura del dispositivo (condición inicial)
phi = -k * A1 * (u1 - uw) / h;

fprintf("El flujo de calor estimado es φ = %.4f W/cm\n", phi);
