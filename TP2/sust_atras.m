function x = sust_atras(A, b)
  n = length(b);
  x = zeros(n,1);

  for i=n:-1:1
    S=A(i, i+1: n) * x(i+1: n);
    x(i) = (b(i) - S)/A(i,i);
  endfor
end

% Explicacion
% A(i, i+1:n) → toma los elementos de la fila i, desde la columna i+1 hasta n

