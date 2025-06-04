function [t, y] = adams_rashford(f, inter, Y0, L)

  t = linspace(inter(1),inter(2),L+1)';
  h = (inter(2)-inter(1))/L;

  % reservamos lugar en memoria para y
  y = zeros( length(Y0), L+1 );

  y(:,1) = Y0;

  # transformamos Y0 se convierte en Y(N-3)
  # con rk4 sacamos los siguientes
  for n = 1:3
    k1 = h * f(t(n)  , y(:,n));
    k2 = h * f(t(n)+h/2, y(:,n)+k1/2);
    k3 = h * f(t(n)+h/2, y(:,n)+k2/2);
    k4 = h * f(t(n+1), y(:,n)+k3);

    y(:,n+1) = y(:,n) + (k1+2*k2+2*k3+k4)/6;
  endfor
  for n = 4:L
    # predictor
    y(:, n+1) = y(:, n) + (h/24)*(55*f(t(n), y(:,n)) - 59*f(t(n-1), y(:, n-1)) + 37*f(t(n-2), y(:, n-2)) - 9*f(t(n-3), y(:, n-3)));
    #y(:,n+1) = y(:,n) + h*f(t(n),y(:,n));
    #corrector
    y(:, n+1) = y(:, n) + (h/24)*(9*f(t(n+1), y(:,n+1)) + 19*f(t(n), y(:, n)) - 5*f(t(n-1), y(:, n-1)) + f(t(n-2), y(:, n-2)));
  end

  y = y';
endfunction
