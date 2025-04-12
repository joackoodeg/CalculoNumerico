function x = sust_adelante(A, b)
  n = length(b);
  x = zeros(size(b));

  % Resolvemos de arriba hacia abajo
  x(1) = b(1)/A(1,1);

  for i = 2:n
    % Forma vectorizada: extraemos todos los valores conocidos de una vez
    x(i) = (b(i) - A(i,1:i-1)*x(1:i-1))/A(i,i);
  end
end
