N = 100;

A = zeros(N,N);
B = zeros(N,1);

A(1,1) = 1;
b(1) = 0;

%Ultima ecuacion
A(N,N) = 1;
b(N) = 0;

for i =2 : N-1
  A(i, i-1) = -1;
  A(i, i) = 2;
  A(i, i+1) = -1;
  b(i) = 1/(N ^ 2);
endfor

x = gauss_elim(A,b);

t = linspace(0,1,N);
plot(t, x);
grid on;

