function [P, L] = Lagrange(x,y)
  n = length(x);
  P = zeros(1,n);
  L = zeros(n,n);
  L(:,n) = ones(n,1);
  for i = 1:n
    for j=1:i-1
      L(i,:) = (conv(L(i,:),[1,-x(j)]))(2:n+1)/(x(i) - x(j));
    endfor
    
    for j = i+1:n
      L(i,:) = (conv(L(i,:),[1,-x(j)]))(2:n+1)/(x(i) - x(j));
    endfor
    P = P + y(i)*L(i,:); # armamos el polinomio de lagrange
  endfor
endfunction
