function [p,err] = biseccion(f,a,b,maxit,tol) # h: error
  tic()
  fa = f(a)
  fb = f(b)
  # nitmin = log((b-a) / tol) / log(2)
  if sign(fa) * sign(fb) > 0
    error('no se cumple la regla de los signos')
  end

  it = 0;
  while it < maxit
    it++;

    p = (b+a)/2;
    fp = f(p);
    err(it) = abs(fp);

    if err(it) < tol
      break
    end

    if sign(fp) * sign(fb) < 0
      fa = fp;
      a = p;
    else
      fb = fp;
      b = p;
    end
  end

  toc();
endfunction

