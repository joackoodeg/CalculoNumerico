k0= 1;

% Extremo derecho aislado → flujo nulo:
% −K0u′(3)=0
% (Neumann con ϕ=0)

%% −K0​u′′(x)=f(x)
%% −(1)* u′′(x)=20⋅sin(5(x−1))
%% -u′′(x) + 0 * u′(x) + 0 * u(x) =20⋅sin(5(x−1))

%% p = 0,  q = 0, r = 20sin(5(x-1))

f = @(x) [0 .* x,0 .* x, -20 .* sin(5 .* (x - 1))];
inter = [0, 3];
ycd = 21; % u(0) = 3

% Condición de contorno derecha (Robin): A y'(b) + B y(b) = C
% Para u'(3) = 0, elegimos A=1, B=0, C=0
rob = [1, 0, 0];

h = 0.01;
L = (inter(2)-inter(1))/h;

[x,y] = dif_fin_rob(f,inter,ycd,rob,L);

plot(x, y, 'b');
grid on;

%%%
temp_der = y(end);
fprintf("Temperatura en el extremo derecho (x = 3): %.2f °C\n",temp_der);

%%% punto y max temp_der
[max_temp, idx] = max(y);
fprintf("Temperatura máxima: %.2f °C en x = %.2f\n", max_temp, x(idx));
