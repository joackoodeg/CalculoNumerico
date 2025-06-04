% Definimos funciones
f = @(x) sin(x) + cos(1 + x.^2) - 1;
df = @(x) cos(x) - 2*x.*sin(1 + x.^2);

tol = 1e-10; % 10 dígitos correctos
kmax = 100;

% Primera raíz (cerca de 1.9)
disp('Primera raíz (cerca de 1.9):')

% Bisección
[x_bisec1, h_bisec1] = biseccion(f, 1, 3, kmax, tol);
fprintf('Bisección: x = %.10f, iteraciones = %d\n', x_bisec1, length(h_bisec1)-1);

% Newton
[x_newton1, h_newton1] = newton(f, df, 1.9, kmax, tol);
fprintf('Newton: x = %.10f, iteraciones = %d\n', x_newton1, length(h_newton1)-1);

% Secante
[x_secante1, h_secante1] = secante(f, 1.5, 2, kmax, tol);
fprintf('Secante: x = %.10f, iteraciones = %d\n', x_secante1, length(h_secante1)-1);

% Segunda raíz (cerca de 2.5)
disp('Segunda raíz (cerca de 2.5):')

% Bisección
[x_bisec2, h_bisec2] = biseccion(f, 2.3, 2.8, kmax, tol);
fprintf('Bisección: x = %.10f, iteraciones = %d\n', x_bisec2, length(h_bisec2)-1);

% Newton
[x_newton2, h_newton2] = newton(f, df, 2.5, kmax, tol);
fprintf('Newton: x = %.10f, iteraciones = %d\n', x_newton2, length(h_newton2)-1);

% Secante
[x_secante2, h_secante2] = secante(f, 2.3, 2.8, kmax, tol);
fprintf('Secante: x = %.10f, iteraciones = %d\n', x_secante2, length(h_secante2)-1);

