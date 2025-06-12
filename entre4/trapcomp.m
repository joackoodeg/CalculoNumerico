function I = trapcomp(x,y)
  # regla NC compuesta en funcion de un conjunto de datos
  L = length(x)-1;
  I = 0;
  for i = 1:L
    h = x(i+1) - x(i);
    yi1 = y(i);
    yi2 = y(i+1);

    S = (h/2)*(yi1 + yi2);
    %I = I + abs(S);
    I += abs(S);
  endfor

endfunction
