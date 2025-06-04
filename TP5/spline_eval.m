function val = spline_eval(x_eval, x, a, b, c, d)
  val = zeros(size(x_eval));
  for i = 1:length(x)-1
    idx = x_eval >= x(i) & x_eval <= x(i+1);
    xx = x_eval(idx) - x(i);
    val(idx) = a(i) + b(i)*xx + c(i)*xx.^2 + d(i)*xx.^3;
  endfor
endfunction
