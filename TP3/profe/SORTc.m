function [x, it, rh, t]=SORTc(A, b, x0, maxit, tol,w)
 tic();
 [T,c] = Tc_SOR(A,b,w);
 [x, it, rh] = iteracionTc(T, c, x0, maxit, tol)
 t = toc();
 endfunction