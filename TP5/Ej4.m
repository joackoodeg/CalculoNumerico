% Datos del problema - ESTA MAL
% Para un spline cúbico, necesitamos que se cumplan las condiciones de continuidad:
% 1. S0(1) = S1(1) (continuidad de la función)
% 2. S0'(1) = S1'(1) (continuidad de la primera derivada)
% 3. S0''(1) = S1''(1) (continuidad de la segunda derivada)
% 4. S0''(0) = 0 y S1''(2) = 0 (condiciones de spline natural

x = [0 0.5 1 2 3];
y = [1 1.5 2 0 1];

% Llamar a la función del profesor
[a, b, c, d] = cubic_spline_natural(x, y);  % Asegurate de tenerla guardada

% Función para evaluar el spline por tramos
function val = spline_eval(xx, x, a, b, c, d)
  val = zeros(size(xx));
  for j = 1:length(x)-1
    idx = xx >= x(j) & xx <= x(j+1);
    dx = xx(idx) - x(j);
    val(idx) = a(j) + b(j)*dx + c(j)*dx.^2 + d(j)*dx.^3;
  endfor
endfunction

% Evaluación
xx = linspace(0, 3, 200);
yy = spline_eval(xx, x, a, b, c, d);

% Graficar
plot(xx, yy, 'b-', x, y, 'ro', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
legend('Spline natural S(x)', 'Datos');
title('Ejercicio 4 - Spline cúbico natural');
grid on;

