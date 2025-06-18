% EjParcial2024_3.m
% Ejercicio 3 – Longitud de la elipse 9x^2 + y^2 = 9
% Se pide:
% a) Longitud exacta (10 cifras significativas)
% b) Longitud aproximada usando cuadratura de Gauss compuesta
%    con 2 puntos por subintervalo y 7 subintervalos iguales.
%    Indicar cuántas cifras de la longitud exacta se obtienen.

format long;

% Parámetros de la elipse 9x^2 + y^2 = 9
% Forma canónica: x^2/a^2 + y^2/b^2 = 1
% => a = 1,  b = 3

a = 1;
b = 3;

%% a)

f = @(t) sqrt( a^2 .* sin(t).^2 + b^2 .* cos(t).^2 );

N_ref = 2000;  % muchos subintervalos para gran precisión
n_ref = 4;     % 4 puntos de Gauss por subintervalo
L_exact = cuad_gauss_c(f, 0, 2*pi, N_ref, n_ref);

fprintf('(a) Longitud (10 cifras sig.) por cuadratura de alta precisión:\n');
fprintf('    L ≈ %.10f\n\n', L_exact);

% =========================
% (b) Gauss 2-puntos compuesto con 7 subintervalos
% =========================
% Función a integrar: f(t) = ||alpha'(t)||
% alpha(t) = (a cos t , b sin t)
% => ||alpha'(t)|| = sqrt( a^2 sin^2 t + b^2 cos^2 t )

f = @(t) sqrt( a^2 .* sin(t).^2 + b^2 .* cos(t).^2 );

N = 7;    % subintervalos
n = 2;    % puntos de Gauss por subintervalo
L_gauss = cuad_gauss_c(f, 0, 2*pi, N, n);

fprintf('(b) Aproximación con Gauss 2-puntos y 7 subintervalos:\n');
fprintf('    L ≈ %.10f\n', L_gauss);

% Calcular número de cifras correctas
err_abs = abs(L_exact - L_gauss);
% Cifras correctas = floor( -log10( err_abs / L_exact ) )
if err_abs == 0
    cifras = Inf;
else
    cifras = floor( -log10( err_abs / L_exact ) );
end
fprintf('    Error absoluto : %.3e\n', err_abs);
fprintf('    Cifras correctas: %d\n', cifras);

% Para verificar con el valor mostrado en el examen (13.36489322)
