function x = sust_atras(A, b)
  n = length(b);
  x = zeros(size(b));

  % Resolvemos de abajo hacia arriba
  x(n) = b(n)/A(n,n);

  for i = n-1:-1:1
    % Forma vectorizada: extraemos todos los valores conocidos de una vez
    x(i) = (b(i) - A(i,i+1:n)*x(i+1:n))/A(i,i);
  end
end
