function [a,b,c,d] = cubic_spline_clamped(x,y,ypa,ypb)
# OJO!tanto x como y lo paso como un arreglo filas:
# lo probamos con el trabajo practico guia 5


  # cantidad de puntos
  n = length(x);

  # inicializamos matriz A y vector lado derecho z
  A = zeros(n,n);
  z = zeros(n,1);

 # h(j) = x(j+1)-x(j)
  h = [x(2:n) - x(1:n-1)]'; # lo expresamos como vector columna

  # En Adown formo la diagonal inferior
  Adown=A;
  Asup=A;

  # diagonal principal dp
  dp = zeros(n,1);
  dp(2:n-1) = 2*(h(1:n-2) + h(2:n-1)); # puntos interiores
  dp(1) = 2*h(1); % primera fila
  dp(n) = 2*h(n-1); % ultima fila

  # diagonal Superior
  Asup(1:n-1,2:n) = diag(h(1:n-1));
  # diagonal Inferior
  Adown(2:n,1:n-1)= diag(h(1:n-1));

  # Armo la matriz A con los datos de arriba

  A = Asup + Adown + diag(dp);

  #A = diag([1,2*(h(1:n-2) + h(2:n-1)),1]) + diag([h(1:n-2),0],-1) + diag([0,h(2:n-1)],1);

  # Vector de términos independientes del sistema A*c = z, que calcula c
  # lo dividimos en partes separando las condiciones del contorno
  # puntos interiores
  z(2:n-1) = 3*[((y(3:n) - y(2:n-1))'./h(2:n-1) - (y(2:n-1) - y(1:n-2))'./h(1:n-2))];
  z(1) = 3*((y(2) - y(1))/h(1) - ypa);
  z(n) = 3*(ypb -(y(n) - y(n-1))/h(n-1));

  # Calculamos los coeficientes c
  % use el calculo con Octave, se deberia usar la función gauss programada
  % de metodos directos
  c=A\z;


  # Calculamos los coeficientes d
  d = (c(2:n) - c(1:n-1))./(3 * h(1:n-1));
  # Calculamos los coeficientes b
  # (y(2:n) - y(1:n-1))'  (falto poner ')
  b = ((y(2:n) - y(1:n-1))'./h(1:n-1)) - h(1:n-1).*(c(2:n) + 2*c(1:n-1))/3;
  # S(Xj) = f(Xj) = a(j)
  a = y(1:n-1)';
  # Defino c
  c = c(1:n-1);
