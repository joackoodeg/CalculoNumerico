function [t,y] = euler_atras(f, dfdy, a, b, y0, N)
  tol = 1e-9;
  kmax = 100;
  h = (b - a)/N;
  t = linspace(a, b, N+1)';
  y = zeros(size(t));
  y(1) = y0;

  for n = 1:N
    yi = y(n);  % valor inicial para Newton
    k = 1;
    while k < kmax
      g = yi - y(n) - h * f(t(n+1), yi);
      dg = 1 - h * dfdy(t(n+1), yi);
      y_next = yi - g/dg;
      if abs(y_next - yi) < tol
        break;
      endif
      k = k + 1;
      yi = y_next;
    endwhile
    y(n+1) = y_next;
  endfor
endfunction

