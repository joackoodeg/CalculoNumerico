  A=[10 5 0 0; 5 10 -4 0; 0 -4 8 -1; 0 0 -1 5];
  b = [5; 25; -11; -11];

  x0 = zeros(length(b), 1);
  %x0 = zeros(size(A,1), 1);  % también podés usar size(A,2) si A es cuadrada

  maxit=1000;
  tol = 1e-8;

  for w=1.0:0.1:1.9
    [x, ~, it] = sor(A,b,x0,maxit,tol,w); % ~ significa que no retorne esa variable
    printf("w = %.1f, it = %f\n", w, it);
  end
