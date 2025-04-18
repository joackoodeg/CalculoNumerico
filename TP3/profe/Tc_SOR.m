function [T, c, t]=Tc_SOR(A, b, w)
 tic();
 wU = -w*triu(A,1);
 D = diag(diag(A));
 wL = -w*tril(A,-1);
 DwLi = inv(D-wL);
 T = DwLi*((1-w)*D+wU);
 c = DwLi*b;
 t = toc();
 endfunction