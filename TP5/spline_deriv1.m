function val = spline_deriv1(x_eval, x, b, c, d)
  val = zeros(size(x_eval));
  for i = 1:length(x)-1
    idx = x_eval >= x(i) & x_eval <= x(i+1);
    xx = x_eval(idx) - x(i);
    val(idx) = b(i) + 2*c(i)*xx + 3*d(i)*xx.^2;
  endfor
endfunction

