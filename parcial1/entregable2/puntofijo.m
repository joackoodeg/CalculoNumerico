function [x, h] = puntofijo(g, x0, kmax, tol)
  h = x0;  % Lista para guardar iteraciones
  for k = 1:kmax
    x1 = g(x0);
    h(end + 1) = x1;

    % --------- CRITERIOS DE CONVERGENCIA ---------

    % 1. Criterio por diferencia absoluta entre iteraciones consecutivas
    if abs(x1 - x0) < tol
      break;
    endif

    % 2. Criterio por diferencia relativa (útil cuando se acerca a cero no es conveniente)
    % if abs((x1 - x0)/x1) < tol
    %   break;
    % endif

    % 3. Criterio por función residual (si tuvieras f(x), no solo g(x))
    % if abs(f(x1)) < tol
    %   break;
    % endif

    % -----------------------------------------------------------

    x0 = x1;
  endfor
  x = x1;
endfunction

