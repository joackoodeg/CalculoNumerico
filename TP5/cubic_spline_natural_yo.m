function [a, b, c, d] = cubic_spline_natural_yo(x, f)
  n = length(x) - 1;
  h = diff(x);
  a = f;

  % Construcción del sistema para c (segunda derivada)
  A = zeros(n+1);
  rhs = zeros(n+1, 1);

  A(1,1) = 1;  % S''(x0) = 0
  A(n+1,n+1) = 1;  % S''(xn) = 0

  for i = 2:n
    A(i,i-1) = h(i-1);
    A(i,i)   = 2*(h(i-1)+h(i));
    A(i,i+1) = h(i);
    rhs(i) = 3*((f(i+1)-f(i))/h(i) - (f(i)-f(i-1))/h(i-1));
  end

  c = A \ rhs;  % Resolver el sistema lineal

  % Calcular b y d
  b = zeros(n,1);
  d = zeros(n,1);
  for i = 1:n
    b(i) = (a(i+1) - a(i))/h(i) - h(i)*(2*c(i) + c(i+1))/3;
    d(i) = (c(i+1) - c(i)) / (3*h(i));
  end

  % Ajustar a para retornar como vector sin duplicar nodos
  a = a(1:n);
  c = c(1:n);
end

