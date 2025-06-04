function [x, it, rh, t]=JacobiTc(A, b, x0, maxit, tol)
 tic();
 [T,c] = Tc_Jacobi(A,b);
 [x, it, rh] = iteracionTc(T, c, x0, maxit, tol)
 t = toc();
 endfunction