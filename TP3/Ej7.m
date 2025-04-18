clc;

n = 1000;
i = (1:n)';

main_diag = 2 * i;
diag2 = 0.5 * i(1:end-2);
diag4 = 0.25 * i(1:end-4);

A = diag(main_diag) + ...
    diag(diag2, 2) + diag(diag2, -2) + ...
    diag(diag4, 4) + diag(diag4, -4);

b = pi * ones(n, 1);

x0 = zeros(n, 1);
maxit = 1000;
tol = 1e-5;

% ------------------------------
% Método de Jacobi
% ------------------------------

tic;
[x_jacobi, rj, it_jacobi] = jacobi(A, b, x0, maxit, tol);
t_jacobi = toc;
fprintf("Jacobi: %d iteraciones, tiempo: %.4f s\n", it_jacobi, t_jacobi);

% ------------------------------
% Método de Gauss-Seidel
% ------------------------------
tic;
[x_gs, rgs, it_gs] = gaussseidel(A, b, x0, maxit, tol);
t_gs = toc;
fprintf("Gauss-Seidel: %d iteraciones, tiempo: %.4f s\n", it_gs, t_gs);

% ------------------------------
% Método SOR
% ------------------------------
w = 1.3;  % elegí un omega razonable (podés probar otros)
tic;
[x_sor, rsor, it_sor] = sor(A, b, x0, maxit, tol, w);
t_sor = toc;
fprintf("SOR (w=%.2f): %d iteraciones, tiempo: %.4f s\n", w, it_sor, t_sor);

% ------------------------------
% Graficar residuos
% ------------------------------
% ------------------------------
% Graficar residuos
% ------------------------------
figure;

% Ajustamos longitud del eje X en base a longitud real del vector de residuos
semilogy(1:length(rj), rj, 'b', 'LineWidth', 1.5); hold on;
semilogy(1:length(rgs), rgs, 'r', 'LineWidth', 1.5);
semilogy(1:length(rsor), rsor, 'g', 'LineWidth', 1.5);

xlabel('Iteraciones');
ylabel('Residuo relativo (norma infinita)');
title('Convergencia de métodos iterativos');
legend('Jacobi', 'Gauss-Seidel', sprintf('SOR (\\omega=%.2f)', w));
grid on;
