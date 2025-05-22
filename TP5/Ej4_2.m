%% EJERCICIO 4 - PARTE C) usando cubic_spline_natural
fprintf('MÉTODO 1: Resolución analítica directa\n');
fprintf('=====================================\n');

% Resolución analítica usando las condiciones de continuidad
% S0'(1) = S1'(1) → b = -1
% S0''(1) = S1''(1) → c = -3
% S1''(2) = 0 (condición natural) → d = 1

b_analitico = -1;
c_analitico = -3;
d_analitico = 1;

fprintf('Resultados analíticos:\n');
fprintf('b = %g\n', b_analitico);
fprintf('c = %g\n', c_analitico);
fprintf('d = %g\n\n', d_analitico);

fprintf('MÉTODO 2: Usando la función cubic_spline_natural\n');
fprintf('===============================================\n');

% Para usar la función, necesitamos los puntos por los que pasa el spline
% Sabemos que:
% - S(0) = S0(0) = 1 + 2(0) - 0³ = 1
% - S(1) = S0(1) = 1 + 2(1) - 1³ = 2
% - S(2) = S1(2) = 2 + b(2-1) + c(2-1)² + d(2-1)³ = 2 + b + c + d

% Calculamos S(2) usando los coeficientes analíticos
S_2 = 2 + b_analitico + c_analitico + d_analitico;

% Definir los puntos del spline
x_nodes = [0, 1, 2];
y_nodes = [1, 2, S_2];

fprintf('Puntos del spline:\n');
fprintf('x = [%g, %g, %g]\n', x_nodes);
fprintf('y = [%g, %g, %g]\n\n', y_nodes);

% Aplicar la función cubic_spline_natural
[a_coef, b_coef, c_coef, d_coef] = cubic_spline_natural(x_nodes, y_nodes);

fprintf('Coeficientes obtenidos con cubic_spline_natural:\n');
fprintf('Tramo 1 [0,1]: a=%g, b=%g, c=%g, d=%g\n', a_coef(1), b_coef(1), c_coef(1), d_coef(1));
fprintf('Tramo 2 [1,2]: a=%g, b=%g, c=%g, d=%g\n\n', a_coef(2), b_coef(2), c_coef(2), d_coef(2));

% Los coeficientes del segundo tramo corresponden a S1(x)
% Pero están en la forma: a + b(x-x1) + c(x-x1)² + d(x-x1)³
% donde x1 = 1, entonces coinciden directamente con nuestros b, c, d

b_numerico = b_coef(2);
c_numerico = c_coef(2);
d_numerico = d_coef(2);

fprintf('RESULTADOS FINALES:\n');
fprintf('==================\n');
fprintf('                Analítico    Numérico     \n');
fprintf('b              %9.6f    %9.6f    \n', b_analitico, b_numerico);
fprintf('c              %9.6f    %9.6f    \n', c_analitico, c_numerico);
fprintf('d              %9.6f    %9.6f    \n\n', d_analitico, d_numerico);

