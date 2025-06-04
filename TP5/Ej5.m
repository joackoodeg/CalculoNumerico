function ejercicio5()
  clf;  % limpia la figura

  % --------------------------
  % Paso 1: Datos originales
  % --------------------------
  f = @(x) sin(2*pi*x);
  x = linspace(-1, 1, 21);
  y = f(x);

  % Interpolación de Lagrange
  [P, ~] = Lagrange(x, y);
  xx = linspace(-1, 1, 500);
  yy_lagrange = polyval(P, xx);

  % Interpolación por Spline Cúbica Natural
  [a, b, c, d] = cubic_spline_natural(x, y);
  yy_spline = spline_eval(xx, x, a, b, c, d);

  % Gráfica original
  figure(1); hold on;
  plot(xx, f(xx), 'k', 'LineWidth', 2);
  plot(xx, yy_lagrange, 'r--', 'LineWidth', 2);
  plot(xx, yy_spline, 'b-.', 'LineWidth', 2);
  legend('f(x) = sin(2πx)', 'Lagrange', 'Spline Cúbica');
  title('Interpolación con datos originales');
  grid on;

  % --------------------------
  % Paso 2: Datos perturbados
  % --------------------------
  y_pert = y + ((-1).^(1:21)) * 1e-4;

  % Interpolación de Lagrange (perturbado)
  [P_pert, ~] = Lagrange(x, y_pert);
  yy_lagrange_pert = polyval(P_pert, xx);

  % Spline perturbado
  [a_pert, b_pert, c_pert, d_pert] = cubic_spline_natural(x, y_pert);
  yy_spline_pert = spline_eval(xx, x, a_pert, b_pert, c_pert, d_pert);

  % Gráfica perturbada
  figure(2); hold on;
  plot(xx, f(xx), 'k', 'LineWidth', 2);
  plot(xx, yy_lagrange_pert, 'r--', 'LineWidth', 2);
  plot(xx, yy_spline_pert, 'b-.', 'LineWidth', 2);
  legend('f(x) = sin(2πx)', 'Lagrange Perturbado', 'Spline Perturbado');
  title('Interpolación con datos perturbados');
  grid on;
endfunction

