% Ejercicio 6
% a) Primero formulamos el sistema a partir de las leyes de Kirchhoff
% Suponiendo que las resistencias son R1=2, R2=4, R3=1, R4=2, R5=5
% y la fuente es de 12V

% Planteo de ecuaciones:
% Nodo 1: i1 - i2 - i3 = 0
% Nodo 2: i2 + i3 - i4 = 0
% Malla 1: 2*i1 + 4*i2 = 12
% Malla 2: -4*i2 + 1*i3 + 5*i4 = 0

% Sistema Ax = b donde x = [i1; i2; i3; i4]
A = [1, -1, -1, 0;
     0, 1, 1, -1;
     2, 4, 0, 0;
     0, -4, 1, 5];

b = [0; 0; 12; 0];

x = gauss_elim(A, b);

e = norm(A*x-b);
disp(e);

disp('Las corrientes del circuito son:');
disp(['i1 = ', num2str(x(1))]);
disp(['i2 = ', num2str(x(2))]);
disp(['i3 = ', num2str(x(3))]);
disp(['i4 = ', num2str(x(4))]);


