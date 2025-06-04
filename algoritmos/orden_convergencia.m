function p = orden_convergencia(errors)
  n = length(errors);
  p = zeros(1, n - 2);
  for k = 2:n-1
    p(k-1) = log(errors(k+1)/errors(k)) / log(errors(k)/errors(k-1));
  end
end
