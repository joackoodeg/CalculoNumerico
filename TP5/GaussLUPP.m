function [x] = GaussLUPP(A, b)
  n = length(b);
  P = eye(n);
  L = zeros(n);
  U = A;

  for k = 1:n-1
    % Pivoteo parcial
    [~, p] = max(abs(U(k:n, k)));
    p = p + k - 1;
    if p != k
      U([k p], :) = U([p k], :);
      P([k p], :) = P([p k], :);
      L([k p], :) = L([p k], :);  % importante para mantener consistencia
    endif

    for i = k+1:n
      L(i, k) = U(i, k) / U(k, k);
      U(i, :) = U(i, :) - L(i, k) * U(k, :);
    endfor
  endfor

  L = L + eye(n);  % agregar 1s en la diagonal

  % Resolver Ly = Pb
  y = zeros(n, 1);
  Pb = P * b;
  for i = 1:n
    y(i) = Pb(i) - L(i,1:i-1) * y(1:i-1);
  endfor

  % Resolver Ux = y
  x = zeros(n, 1);
  for i = n:-1:1
    x(i) = (y(i) - U(i,i+1:n) * x(i+1:n)) / U(i,i);
  endfor
endfunction

