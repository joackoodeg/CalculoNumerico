function [x, it, rh, t] = iteracionTc(T, c, x0, maxit, tol)
 tic();
 x=x0;
 it = 0;
 while it < maxit
 x = T*x0 + c;
 rh(it+1) = norm( x-x0, inf);
 %rh(it+1) = norm((x-x0),inf)/norm((x),inf);
 if rh(it+1) < tol
 break;
 end %if
 it = it + 1;
 x0 = x;
 end %while
 t=toc();
 end %function
