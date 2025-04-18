function [T, c, t]=Tc_GaussSeidel(A, b)
 tic();
 U = -triu(A,1);
 DLinv = inv( tril(A) ); %(L+D)^-1
 T = DLinv*(U);
 c = DLinv*b;
 t = toc();
 %endfunction