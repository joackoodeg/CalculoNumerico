%1)
% -> Diagonal dominante -> Garantiza Convergencia

A=[3 1 1; 1 3 -1; 3 1 -5];
b=[5; 3; -1];

x0=zeros(length(b),1);
maxit=1000;
tol=1e-8;

[x,r,it] = gaussseidel(A,b,x0,maxit,tol);
c = A\b;
if x = c
  printf("1 : son iguales");
else
  printf("1: No son iguales");
endif


