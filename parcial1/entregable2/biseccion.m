function [x, h] = biseccion(f, xmin, xmax, kmax, tol)
  a = xmin;
  b = xmax;
  h = [];           % Historial de aproximaciones
  x_prev = NaN;     % Último valor de x, para criterios basados en diferencias

  for k = 1:kmax
    x = (a + b)/2;      % Punto medio
    h(end+1) = x;       % Guardamos el valor en historial

    % --- Criterios de parada (DESCOMENTAR solo uno) ---

    % 1) Criterio absoluto entre dos iteraciones:
    % if k > 1 && abs(x - x_prev) <= tol
    %   return;
    % endif

    % 2) Criterio relativo entre dos iteraciones:
    % if k > 1 && abs(x - x_prev)/abs(x) <= tol
    %   return;
    % endif

    % 3) Criterio del valor de la función:
    if abs(f(x)) <= tol || abs(b - a)/2 < tol
      return;
    endif

    % ----------------------------------------------

    % Actualizamos extremos según el signo
    if f(a) * f(x) < 0
      b = x;
    else
      a = x;
    endif

    % Guardamos valor anterior de x para próximas iteraciones
    x_prev = x;
  endfor
endfunction

