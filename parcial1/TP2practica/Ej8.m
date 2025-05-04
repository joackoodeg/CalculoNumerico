% Definimos las matrices
A1 = [8 4 1; 2 6 2; 2 4 8];
A2 = [5.00e-02 5.57e+02 -4.00e-02; 1.98e+00 1.94e+02 -3.00e-03; 2.74e+02 3.11e+00 7.50e-02];
A3 = [1 2 -1; 2 4 0; 0 1 -1];

b = [1; 2; 3];

n = length(b);

A = A3;

[A_1, r]= doolittle_p(A);

Af = A_1(r, :);
bp = b(r);

L = tril(Af, -1) + eye(n);
U = triu(Af);

y = sust_adelante(L, bp);
x= sust_atras(U,y);

x_g = A \ b;

disp(x_g);

disp(x);

r = (A*x - b);

disp(norm(r));

