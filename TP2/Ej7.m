N = 100;

A= zeros(N,N);
b = zeros(N,1);

% Primera Ecuacion:
% [1 0 0 0 ... N] b = 0
A(1,1) = 1;
b(1) = 0;

%Ultima ecuacion
A(N,N) = 1;
b(N) = 0;

% Ecuaciones del medio:

for i=2: N-1
  A(i, i-1) = -1;
  A(i,i) = 2;
  A(i, i+1) = -1;
  b(i) = 1/(N^2);
endfor

x = gauss_elim(A,b);

% GRAFICA

% N puntos uniformemente distribuidos entre 0 y 1
t = linspace (0,1,N);

plot(t, x, 'b-'); % linea azul
xlabel('t'); ylabel('x(t)'); title('Soluciones al sistema y=x(t)');
grid on;
