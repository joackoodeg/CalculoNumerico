f1 = @(x) sin(pi * x);                  % Función 1: sen(pi*x)
f2 = @(x) 1 ./ (1 + x.^2);              % Función 2: 1/(1 + x^2)

I1 = 0;                                % Integral exacta de sin(pi*x) de 0 a 5
I2 = atan(5) - atan(-5);               % Integral exacta de 1/(1+x^2) de -5 a 5

a1 = 0; b1 = 5;
a2 = -5; b2 = 5;

n_vals = 2:13;
E1 = zeros(size(n_vals));  % Errores para función 1
E2 = zeros(size(n_vals));  % Errores para función 2

for i = 1:length(n_vals)
    n = n_vals(i);
    Q1 = intNCcompuesta(f1, a1, b1, 1, n);
    Q2 = intNCcompuesta(f2, a2, b2, 1, n);

    E1(i) = abs(I1 - Q1);
    E2(i) = abs(I2 - Q2);
end

% Mostrar resultados
disp('n     Error f1         Error f2');
for i = 1:length(n_vals)
    fprintf('%2d   %.3e     %.3e\n', n_vals(i), E1(i), E2(i));
end


x_dense1 = linspace(a1, b1, 1000); % malla fina para graficar
x_dense2 = linspace(a2, b2, 1000);

n_vals = [5, 9, 13];  % para mostrar algunos casos significativos

for n = n_vals
  % Interpolación para f1
  x_nodes1 = linspace(a1, b1, n);
  y_nodes1 = f1(x_nodes1);
  p1 = polyfit(x_nodes1, y_nodes1, n-1);

  % Explicacion n-1:
  % Cuando hacés interpolación polinómica,
  % usás n nodos para construir un polinomio de grado n−1
  % que pase exactamente por esos n puntos.

  y_interp1 = polyval(p1, x_dense1);

  figure();
  plot(x_dense1, f1(x_dense1), 'b', 'LineWidth', 2);
  hold on;
  plot(x_dense1, y_interp1, 'r--', 'LineWidth', 2);
  plot(x_nodes1, y_nodes1, 'ko');
  title(sprintf('f1(x) vs. polinomio interpolante (n = %d)', n));
  legend('f(x)', 'Interpolante', 'Puntos');
  grid on;

  % Interpolación para f2
  x_nodes2 = linspace(a2, b2, n);
  y_nodes2 = f2(x_nodes2);
  p2 = polyfit(x_nodes2, y_nodes2, n-1);
  y_interp2 = polyval(p2, x_dense2);

  figure();
  plot(x_dense2, f2(x_dense2), 'b', 'LineWidth', 2);
  hold on;
  plot(x_dense2, y_interp2, 'r--', 'LineWidth', 2);
  plot(x_nodes2, y_nodes2, 'ko');
  title(sprintf('f2(x) vs. polinomio interpolante (n = %d)', n));
  legend('f(x)', 'Interpolante', 'Puntos');
  grid on;
end
