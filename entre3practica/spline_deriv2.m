function val = spline_deriv2(x_eval, x, c, d)
  val = zeros(size(x_eval));
  for i = 1:length(x)-1
    idx = x_eval >= x(i) & x_eval <= x(i+1);
    xx = x_eval(idx) - x(i);
    val(idx) = 2*c(i) + 6*d(i)*xx;
  endfor
endfunction
