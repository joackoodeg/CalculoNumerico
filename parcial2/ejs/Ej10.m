x = [1 2 3];
y = 5 ./ x;

[S, dS, ddS]= funcion_spline(x,y);


%%% en funcion spline
%% coeficientes = [a; b; c; d];  % cada fila tiene coeficientes para un tramo
%% assignin("base", "coeficientes_spline", coeficientes);

%% dsp en la ventana de comandos poner: coeficientes_spline

%% arroja:
%᝖>> coeficientes_spline
%coeficientes_spline =
%
%   5.000000000000000
%   2.500000000000000
%  -2.916666666666667
%  -1.666666666666667
%                   0
%   1.250000000000000
%   0.416666666666667
%  -0.416666666666667


%% osea
%coeficientes_spline =
%   a₀  = 5.0000
%   a₁  = 2.5000
%   b₀  = -2.9167
%   b₁  = -1.6667
%   c₀  = 0
%   c₁  = 1.2500
%   d₀  = 0.4167
%   d₁  = -0.4167

