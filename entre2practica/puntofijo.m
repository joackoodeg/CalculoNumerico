function [x, h] = puntofijo(g, x0, kmax, tol)
  h = x0;  % Inicializamos la lista de iteraciones
  for k = 1:kmax
    x1 = g(x0);       % Nueva iteración
    h(end + 1) = x1;  % Guardamos la iteración
    if abs(x1 - x0) < tol
      break;
    endif
    x0 = x1;
  endfor
  x = x1;
endfunction
