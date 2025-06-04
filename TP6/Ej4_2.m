f1 = @(x) sin(pi .* x);
f2 = @(x) 1 ./ (1 + x .^ 2);

%% Integrales exactas
I1 = integral(f1,0,5);
I2 = integral(f2, -5,5);

%% intervalos
a1=0; b1= 5;
a2=-5; b2=5;

%% declaracion de auxiliares
n_vals = 2:13;

% guardar errores
E1 = zeros(size(n_vals));
E2 = zeros(size(n_vals));

% Obtener tabla
% Si L = 1, se aplica la fórmula una sola vez en todo el intervalo [a,b][a,b].
%-> Esto equivale a usar la fórmula Newton-Cotes directamente en el intervalo completo, es decir, sin dividirlo.

for i=1:length(n_vals)
  n = n_vals(i);
  Q1 = intNCcompuesta(f1,a1,b1,1,n);
  Q2 = intNCcompuesta(f2,a2,b2,1,n);

  E1(i) = abs(Q1-I1);
  E2(i) = abs(Q2-I2);
endfor

% Mostrar resultados
disp('n     Error f1         Error f2');
for i = 1:length(n_vals)
    fprintf('%2d   %.3e     %.3e\n', n_vals(i), E1(i), E2(i));
end

x_dense1 = linspace(a1, b1, 1000); % malla fina para graficar
x_dense2 = linspace(a2, b2, 1000);

n_vals = [5, 9, 13]; %% casos a mostrar (son muchos)

for i = n_vals
  x_nodes1 = linspace(a1,b1,1000);
  x_nodes2 = linspace(a2,b2,1000);

  y_nodes1 = f1(x_nodes1);
  y_nodes2 = f2(x_nodes2);

  p1 = polyfit(x_nodes1,y_nodes1, n-1);
  p2 = polyfit(x_nodes2,y_nodes2, n-1);

  figure();
  plot(x_dense1, f1(x_dense1), 'b', 'LineWidth', 2);
  hold on;
  plot(x_dense1, y_interp1, 'r--', 'LineWidth', 2);
  title(sprintf('f1(x) vs. polinomio interpolante (n = %d)', n));
  legend('f(x)', 'Interpolante');
  grid on;

  figure();
  plot(x_dense2, f2(x_dense2), 'b', 'LineWidth', 2);
  hold on;
  plot(x_dense2, y_interp2, 'r--', 'LineWidth', 2);;
  title(sprintf('f2(x) vs. polinomio interpolante (n = %d)', n));
  legend('f(x)', 'Interpolante');
  grid on;
endfor




