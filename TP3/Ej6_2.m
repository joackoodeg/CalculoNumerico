%2)

% No es diagonal domiannte - > Puede no converger -> cambiar fila 2 y 3

A=[3 1 1; 1 3 -1; 3 1 -5];
b=[5; 3 ;-1];

x0=zeros(length(b),1);
maxit=1000;
tol=1e-2;

[x,r,it] = gaussseidel(A,b,x0,maxit,tol);
disp(x);
c = A\b;
disp(c);

%  NaN
%   NaN
%   NaN
%   1
%   1
%   1

if x = c
  printf("2 : son iguales");
else
  printf("2: No son iguales");
endif

% Conclusion:
% El orden de las ecuaciones influye en la convergencia de Gauss-Seidel,
% pero no en el método directo.

% Si la matriz no es diagonalmente dominante, Gauss-Seidel puede fallar.

% El método directo siempre funciona (si se hace con pivoteo cuando es necesario), pero es más costoso computacionalmente.
