% Define w(x) y P(x)
w = @(x) (D * W1 / L) * (L - x);
P = @(x) (2 * W1 / L) * (L - x) + 2 * D;

% Despejes estándar
p = @(x) -1 ./ (L - x);
q = @(x) (H / k) * (P(x) ./ w(x));
r = @(x) -q(x) * uE;

% Devuelve la función columna
f = @(x) [p(x), q(x), r(x)];

% Parámetros físicos
H = 6e-3;      % coef. convección
k = 2.04;      % conductividad
D = 0.2;       % profundidad
W1 = 2;        % ancho base
L = 6;         % largo total
uE = 40;       % temperatura externa

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Metodo 1:
idx = find (x >= 2.5);
disp(y(idx(1)));

%% metodo 2:
[~, idx_medio] = min(abs(x - 2.5));
disp(y(idx_medio));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% obtener con centrada
%% a
idx = find(x >= 2.5, 1);
disp(y(idx));

%%% b
h = x(2) - x(1);
deriv = (y(idx + 1) - y(idx - 1)) / (2 * h);
disp(deriv);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% para pasar polyfit a secante o algo asi hay que hacerla funcion
poly_func = @(t) polyval(p, t);

kmax = 10000;
tol = 1e-9;

[x1, h1] = secante(poly_func, 0.18, 0.25, kmax, tol);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

L = 20;

[t,y]=rk4(F,inter,y0,L);

y_aux= y(end, 1); %% Se toma el ultimo valor, porque 2.5 es extremo de intervalo

% si rk4 no convergue entonces es un loop infinito
while(1)
  L = L*2; % Duplicar cant de pasos para buscar mayor exactitud
 [t,y_dsp]=rk4(F,inter,y0,L);

  y_actual = y_dsp(end,1); % toamos valor actual
  if(abs(y_aux - y_actual)<1e-6) % nos fijamos si cumple la restriccion (6 digitos exactos)
    break;
  endif

  y_aux = y_actual; % CONTINUAMOS
endwhile

disp("valor en t-2.6 con 6 decimales exactos");
disp(y_actual);
