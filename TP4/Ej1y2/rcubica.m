function x = rcubica(a)
  f = @(x) x^3 - a;
  if a >= 1
    [x, ~] = biseccion(f, 0, a, 1000, 1e-12);
  else
    [x, ~] = biseccion(f, 0, 1, 1000, 1e-12);
  endif
endfunction

