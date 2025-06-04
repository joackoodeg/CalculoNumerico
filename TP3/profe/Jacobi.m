function [x, r, it, t]=Jacobi(A, b, x0, maxit, tol)
 tic();
% n = size(A,1);
 n = length(A(1,:));
 x = x0; # debe inicializarse x
 it = 0;
 while ( it < maxit )
 for i = 1:n
 x(i) = ( b(i) - A(i,1:i-1)*x0(1:i-1) - A(i,i+1:n)*x0(i+1:n) ) / A(i,i);
 endfor
 r(it+1) = norm(A*x - b); # norm(x-x0) RESIDUO
 % Otra manera
 % rh(it+1) = norm( x-x0, inf);
 % rh(it+1) = norm((x-x0),inf)/norm((x),inf);

 if r(it+1) < tol %then
 break;
 endif
 x0 = x; % voy pisando la solucion y me va quedando la solucion anterior
 it = it +1; % incremento el nro de iteraciones
 endwhile
 t = toc();
 endfunction
