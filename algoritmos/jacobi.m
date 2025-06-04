function [x, r, it] = jacobi(A, b, x0, maxit, tol)

  n = length(A(1,:));
  x = x0;        % Inicialización de la solución
  it = 0;        % Contador de iteraciones

  while (it < maxit)

    for i = 1:n
      S = A(i,1:i-1)*x0(1:i-1) + A(i,i+1:n)*x0(i+1:n);
      x(i) = (b(i) - S) / A(i,i);
    endfor

    % ==============================
    % CRITERIOS DE CORTE DISPONIBLES
    % ==============================

    % ----> Criterio 1: Norma del residuo ||Ax - b|| (clásico para convergencia del sistema)
    % r(it+1) = norm(A*x - b);
    % if r(it+1) < tol
    %   break;
    % endif

    % ----> Criterio 2: Error absoluto infinito ||x - x0||_inf
    % r(it+1) = norm(x - x0, inf);
    % if r(it+1) < tol
    %   break;
    % endif

    % ----> Criterio 3: Error relativo infinito ||x - x0||_inf / ||x||_inf (activo por defecto)
    r(it+1) = norm(x - x0, inf) / norm(x, inf);
    if r(it+1) < tol
      break;
    endif

    % =================================

    x0 = x;        % Actualizamos para la próxima iteración
    it = it + 1;   % Incrementamos el contador

  endwhile

endfunction

