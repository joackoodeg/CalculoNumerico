function [C, L] = iLagrange(x,y)
  n1 = length(x);
  n=n1-1;
  L=zeros(n1,n1);
  % formacion de los polinomios cardinales de Lagrange
  for k=1:n+1
    V=1;
    for j=1:n+1
      if k~=j
        V=conv(V,poly(x(j)))/(x(k)-x(j));
      endif
    endfor
   % L(k,:)=V; % si pasamos x,y como vector fila
    L(:,k)=V; % % si pasamos x,y como vector columna
  endfor
  
  % calculo de los coeficientes del polinomio
  % interpolador de Lagrange
  
 % C=y*L; % si pasamos x,y como vector fila
 C=L*y; % si pasamos x,y como vector columna