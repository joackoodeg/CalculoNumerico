function Q = trapcomp_old(x,y)
  n = length(x);
  Q = 0;
  for i = 1:n-1
    h = x(i+1)- x(i);
    Q+= h*(y(i+1)+y(i));
  endfor
  Q /= 2;
endfunction
