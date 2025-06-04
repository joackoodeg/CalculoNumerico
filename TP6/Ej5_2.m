% Definición de funciones
f1 = @(x) sin(pi * x);                          % Función 1
f2 = @(x) 1 ./ (1 + x.^2);                      % Función 2
f3 = @(x) abs(x).^(3/2);                        % Función 3

% Intervalos
a1 = 0;   b1 = 5;
a2 = -5;  b2 = 5;
a3 = 0;   b3 = 5;

I1 = integral(f1,a1,b1);
I2 = integral(f2,a2,b2);
I3= integral(f3,a3,b3);

% Valores de L y h
L_vals = 2.^(1:12);   % L = 2, 4, 8, ..., 4096
h1 = (b1 - a1) ./ L_vals;
h2 = (b2 - a2) ./ L_vals;
h3 = (b3 - a3) ./ L_vals;

% Inicializar errores
Etrap1 = zeros(size(L_vals)); Esimp1 = zeros(size(L_vals));
Etrap2 = zeros(size(L_vals)); Esimp2 = zeros(size(L_vals));
Etrap3 = zeros(size(L_vals)); Esimp3 = zeros(size(L_vals));

for i=1: length(L_vals)
  L = L_vals(i);

  Qtrap = intNCcompuesta(f1,a1,b1,L,2);
  Qsimp = intNCcompuesta(f1,a1,b1,L,3);
  Etrap1(i) = abs(I1-Qtrap);
  Esimp1(i) = abs(I1-Qsimp);

  Qtrap = intNCcompuesta(f2,a2,b2,L,2);
  Qsimp = intNCcompuesta(f2,a2,b2,L,3);
  Etrap2(i) = abs(I2-Qtrap);
  Esimp2(i) = abs(I2-Qsimp);

  Qtrap = intNCcompuesta(f3,a3,b3,L,2);
  Qsimp = intNCcompuesta(f3,a3,b3,L,3);
  Etrap3(i) = abs(I3-Qtrap);
  Esimp3(i) = abs(I3-Qsimp);
endfor

% Mostrar resultados en tabla (puedes repetir esto por función)

disp('--- f(x) = sin(pi*x) ---');
disp('  L        h          E_trap        E_simp');
for i = 1:length(L_vals)
    fprintf('%4d   %.4e   %.4e   %.4e\n', L_vals(i), h1(i), Etrap1(i), Esimp1(i));
end

disp('--- f(x) = 1 / (1 + x^2) ---');
disp('  L        h          E_trap        E_simp');
for i = 1:length(L_vals)
    fprintf('%4d   %.4e   %.4e   %.4e\n', L_vals(i), h2(i), Etrap2(i), Esimp2(i));
end

disp('--- f(x) = |x|^{3/2} ---');
disp('  L        h          E_trap        E_simp');
for i = 1:length(L_vals)
    fprintf('%4d   %.4e   %.4e   %.4e\n', L_vals(i), h3(i), Etrap3(i), Esimp3(i));
end

