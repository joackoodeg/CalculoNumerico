function Q = simpsoncomp(x,y)
  % suponemos puntos equiespaciados
  n = length(x);
  Q = 0;
  for i = 2:2:n-1
    Q+= (y(i+1)+4*y(i)+y(i-1));
  endfor
  h = x(2)- x(1);
  Q =Q*h/3;
endfunction