function [x, it, rh, t] = GaussSeidelTc(A, b, x0, maxit, tol)
 tic();
 [T,c] = Tc_GaussSeidel(A, b);
 [x, it, rh] = iteracionTc(T, c, x0, maxit, tol)
 t = toc();
end %function