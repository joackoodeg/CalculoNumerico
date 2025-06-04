% Ejercicio 5 (a) - TP6

% Definición de funciones
f1 = @(x) sin(pi * x);                          % Función 1
f2 = @(x) 1 ./ (1 + x.^2);                      % Función 2
f3 = @(x) abs(x).^(3/2);                        % Función 3

% Intervalos
a1 = 0;   b1 = 5;
a2 = -5;  b2 = 5;
a3 = 0;   b3 = 5;

% Valores exactos de las integrales
I1 = 0;                                % Integral de sin(pi*x) entre 0 y 5
I2 = atan(5) - atan(-5);              % Integral de 1/(1+x^2)
I3 = (2/5) * 5^(5/2);                 % Integral de |x|^(3/2)

% Valores de L y h
L_vals = 2.^(1:12);                      % L = 2, 4, 8, ..., 4096
h1 = (b1 - a1) ./ L_vals;
h2 = (b2 - a2) ./ L_vals;
h3 = (b3 - a3) ./ L_vals;

% Inicializar errores
Etrap1 = zeros(size(L_vals)); Esimp1 = zeros(size(L_vals));
Etrap2 = zeros(size(L_vals)); Esimp2 = zeros(size(L_vals));
Etrap3 = zeros(size(L_vals)); Esimp3 = zeros(size(L_vals));

% Loop para calcular errores
for i = 1:length(L_vals)
    L = L_vals(i);

    % f1: sin(pi*x)
    Qtrap = intNCcompuesta(f1, a1, b1, L, 2);
    Qsimp = intNCcompuesta(f1, a1, b1, L, 3);
    Etrap1(i) = abs(I1 - Qtrap);
    Esimp1(i) = abs(I1 - Qsimp);

    % f2: 1 / (1 + x^2)
    Qtrap = intNCcompuesta(f2, a2, b2, L, 2);
    Qsimp = intNCcompuesta(f2, a2, b2, L, 3);
    Etrap2(i) = abs(I2 - Qtrap);
    Esimp2(i) = abs(I2 - Qsimp);

    % f3: |x|^(3/2)
    Qtrap = intNCcompuesta(f3, a3, b3, L, 2);
    Qsimp = intNCcompuesta(f3, a3, b3, L, 3);
    Etrap3(i) = abs(I3 - Qtrap);
    Esimp3(i) = abs(I3 - Qsimp);
end

% Mostrar resultados en tabla (puedes repetir esto por función)

disp('--- f(x) = sin(pi*x) ---');
disp('  L        h          E_trap        E_simp     EtrapL2/EtrapL   EsimpL2/EsimpL');
for i = 1:length(L_vals)
    if i == 1
        fprintf('%4d   %.4e   %.4e   %.4e      ---              ---\n', ...
            L_vals(i), h1(i), Etrap1(i), Esimp1(i));
    else
        fprintf('%4d   %.4e   %.4e   %.4e   %.4f         %.4f\n', ...
            L_vals(i), h1(i), Etrap1(i), Esimp1(i), ...
            Etrap1(i-1)/Etrap1(i), Esimp1(i-1)/Esimp1(i));
    end
end


disp('--- f(x) = 1 / (1 + x^2) ---');
disp('  L        h          E_trap        E_simp     EtrapL2/EtrapL   EsimpL2/EsimpL');
for i = 1:length(L_vals)
    if i == 1
        fprintf('%4d   %.4e   %.4e   %.4e      ---              ---\n', ...
            L_vals(i), h2(i), Etrap2(i), Esimp2(i));
    else
        fprintf('%4d   %.4e   %.4e   %.4e   %.4f         %.4f\n', ...
            L_vals(i), h2(i), Etrap2(i), Esimp2(i), ...
            Etrap2(i-1)/Etrap2(i), Esimp2(i-1)/Esimp2(i));
    end
end


disp('--- f(x) = |x|^{3/2} ---');
disp('  L        h          E_trap        E_simp     EtrapL2/EtrapL   EsimpL2/EsimpL');
for i = 1:length(L_vals)
    if i == 1
        fprintf('%4d   %.4e   %.4e   %.4e      ---              ---\n', ...
            L_vals(i), h3(i), Etrap3(i), Esimp3(i));
    else
        fprintf('%4d   %.4e   %.4e   %.4e   %.4f         %.4f\n', ...
            L_vals(i), h3(i), Etrap3(i), Esimp3(i), ...
            Etrap3(i-1)/Etrap3(i), Esimp3(i-1)/Esimp3(i));
    end
end


