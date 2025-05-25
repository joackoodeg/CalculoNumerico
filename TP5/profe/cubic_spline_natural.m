function [a,b,c,d] = cubic_spline_natural(x,y)
# tanto x como y lo paso como un arreglo filas:
  n = length(x);

  # inicializamos matriz A y vector lado derecho z
  A = zeros(n,n);
  z = zeros(n,1);

 # h(j) = x(j+1)-x(j)
  h = [x(2:n) - x(1:n-1)]'; # lo exprese como vector columna

  # Matriz A del sistema A*c = z, que calcula c
  # Separar por las condiciones de contorno

  # En Aup formo la diagonal Superior
  Aup=A;

  # diagonal principal
  dp = ones(n,1);
  dp(2:n-1) = 2*(h(1:n-2) + h(2:n-1)); # puntos interiores

  # diagonal Inferior
  A(2:n-1,1:n-2) = diag(h(1:n-2));
  # diagonal Superior
  Aup(2:n-1,3:n)= diag(h(2:n-1));

  # Armo la matriz A con los datos de arriba

  A = A + Aup + diag(dp);

  #A = diag([1,2*(h(1:n-2) + h(2:n-1)),1]) + diag([h(1:n-2),0],-1) + diag([0,h(2:n-1)],1);

  # puntos interiores
  z(2:n-1) = 3*[((y(3:n) - y(2:n-1))'./h(2:n-1) - (y(2:n-1) - y(1:n-2))'./h(1:n-2))];
  # De acuerdo con las condiciones de contorno naturales
  z(1) = 0; # corresponde a la condicion de la frontera de x0 es decir la de la izquierda.
  z(n) = 0; # corresponde a la condicion de la frontera de xn es decir la de la derecha.

  # Calculamos los coeficientes c
  c=A\z; # Usamos el metodo directo de Octave.
  % use el calculo con Octave, se deberia usar la función gauss programada
  % de metodos directos

  # Calculamos los coeficientes d
  d = (c(2:n) - c(1:n-1))./(3 * h(1:n-1));
  # Calculamos los coeficientes b
  b = ((y(2:n) - y(1:n-1))'./h(1:n-1)) - h(1:n-1).*(c(2:n) + 2*c(1:n-1))/3;
  # S(Xj) = f(Xj) = a(j)
  a = y(1:n-1)';
  # Defino c
  c = c(1:n-1);
