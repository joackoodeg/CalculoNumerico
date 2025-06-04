function [x, h] = biseccion(f, xmin, xmax, kmax, tol)
  a = xmin;
  b = xmax;
  h = [];
  for k = 1:kmax
    x = (a + b)/2;
    h(end+1) = x;
    if abs(f(x)) < tol || abs(b - a)/2 < tol
      return;
    endif
    if f(a)*f(x) < 0
      b = x;
    else
      a = x;
    endif
  endfor
endfunction
