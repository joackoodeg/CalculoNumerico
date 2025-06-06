function [x, r, it] = gaussseidel(A, b, x0, maxit, tol)

 n = length(A(1,:));
 x = x0; # debe inicializarse x
 it = 0;

 while ( it < maxit )

 for i = 1:n
  S = A(i,1:i-1) * x(1:i-1) + A(i,i+1:n) * x0(i+1:n);
  x(i) = (b(i) - S) /A(i,i);
 endfor

 r(it+1) = norm(A*x - b); # norm(x-x0)RESIDUO

 % otra manera:
 % rh(it+1) = norm( x-x0, inf);
 % rh(it+1) = norm((x-x0),inf)/norm((x),inf);

  if r(it+1) < tol %then
    break;
  endif

  % NEXT
    x0 = x;
    it = it + 1;

  endwhile

 endfunction
