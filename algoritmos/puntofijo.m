function [x, h] = puntofijo(g, x0, kmax, tol)
  h = x0;  % Inicializamos el historial de iteraciones
  for k = 1:kmax
    x1 = g(x0);       % Nueva iteración
    h(end + 1) = x1;  % Guardamos la iteración

    % ----------- CRITERIOS DE CORTE ----------------

    % 1. Criterio absoluto
    if abs(x1 - x0) < tol
      break;
    endif

    % 2. Criterio relativo
    % if abs((x1 - x0)/x1) < tol
    %   break;
    % endif

    % 3. Criterio por residuo (en punto fijo: |g(x) - x| debe ser pequeño)
    % if abs(g(x1) - x1) < tol
    %   break;
    % endif

    % ------------------------------------------------

    x0 = x1;
  endfor
  x = x1;
endfunction

