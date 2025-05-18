function [x, rh, it] = sor(A, b, x0, maxit, tol, w)

  n = length(A(1,:));
  x = x0;   % Inicialización del vector solución
  it = 0;   % Contador de iteraciones

  while (it < maxit)

    for i = 1:n
      S = A(i,1:i-1)*x(1:i-1) + A(i,i+1:n)*x0(i+1:n);
      x(i) = (1 - w) * x0(i) + w * (b(i) - S) / A(i,i);
    endfor

    % ==============================
    % CRITERIOS DE CORTE DISPONIBLES
    % ==============================

    % ----> Criterio 1: Norma del residuo ||Ax - b||
    % rh(it+1) = norm(A*x - b);
    % if rh(it+1) < tol
    %   break;
    % endif

    % ----> Criterio 2: Error absoluto infinito ||x - x0||_inf
     rh(it+1) = norm(x - x0, inf);
     if rh(it+1) < tol
       break;
     endif

    % ----> Criterio 3: Error relativo infinito ||x - x0||_inf / ||x||_inf (activo por defecto)
    %rh(it+1) = norm(x - x0, inf) / norm(x, inf);
    %if rh(it+1) < tol
    %  break;
    %endif

    % =================================

    x0 = x;       % Guardamos la iteración actual como base
    it = it + 1;  % Incrementamos el contador

  endwhile

endfunction

