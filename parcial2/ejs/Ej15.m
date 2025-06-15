format long;

f = @(x) 1./(4*x);

x = [1, 2, 3];       % puntos equidistantes
y = f(x);            % valores de la función en los puntos

[P, L] = Lagrange(x, y);  % P contiene los coeficientes del polinomio

x_eval = 1.7;
p_eval = polyval(P, x_eval);    % evaluación del polinomio
f_eval = f(x_eval);             % valor real

error_real = abs(f_eval - p_eval)

err_factor = abs((x_eval - x(1))*(x_eval - x(2))*(x_eval - x(3)));
f3_max = 1.5;    % Máximo de |f^{(3)}(x)| en [1,3]
error_teorico = (f3_max / factorial(3)) * err_factor

disp(error_real);
disp(error_teorico);
