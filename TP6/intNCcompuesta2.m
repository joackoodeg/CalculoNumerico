function Q = intNCcompuesta2(f,a,b,c,d,L1,L2,n)
% function Q = intNCcompuesta2(f,a,b,c,d,L1,L2,n)
% aproxima la integral doble de f sobre [a,b]
% y [c,d] utilizando la formula de Newton-Cotes 
% compuesta de n puntos, subdividiendo cada eje 
% en L1 y L2 subintervalos.
sub1 = linspace(a,b,L1+1);
sub2 = linspace(c,d,L2+1);

h = (b-a)/L1;
k = (d-c)/L2;
% calculamos los pesos una sola vez
w = pesosNC(n);
Q = 0;

for j=1:L2
y = linspace(sub2(j),sub2(j+1),n);
  for i=1:L1
    x = linspace(sub1(i),sub1(i+1),n);
    fxy = f(x, y');
    Q = Q +(w'*(fxy*w));
  endfor
endfor
Q *= k*h;

endfunction