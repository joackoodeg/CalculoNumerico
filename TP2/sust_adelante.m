function x = sust_adelante(A, b)
  n = length(b);
  x = zeros(n,1);

  for i=1:n
    S = A(i, 1: i-1) * x(1: i-1);
    x(i) = (b(i) - S) / A(i,i);
  endfor
end

% Explicacion
% A(i, 1:i-1) → elementos desde la columna 1 hasta i−1 de la fila i
% x(1:i-1) → valores de xj ya calculados
