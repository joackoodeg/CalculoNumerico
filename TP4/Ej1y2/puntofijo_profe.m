function [x,err] = puntofijo(g,x0,kmax,tol)
  tic();
  it = 0;
  while it < kmax
    x = g(x0);
    err(it+1) = abs(x-x0);

    if err(it+1) < tol
      break
    end

    x0 = x;
    it++;
  end
  toc();
endfunction
