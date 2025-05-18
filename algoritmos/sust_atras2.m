function [x] = sust_atras2(A)
  x=A(:,end); %necesario para que x sea columna
  n=length(x); %Defino n por ser una variable local.
  x(n)=A(n,n+1)/A(n,n);
  for i=n-1:-1:1
    s=A(i, n+1); %REpresenta al temino de b en la fila i
    for j=i+1:n %lo hacemos para la sumatoria de los terminos a restar
      s=s-A(i,j)*x(j);
    endfor
    x(i)=s/A(i,i);
  endfor
endfunction
