# ESTA MAL

x = [1, 2, 3, 4];
y = [2, 3, 5, 4];
df1 = 0;
dfn = -1;

[ai, bi, ci, di] = cubic_spline_clamped(x, y, df1, dfn);

% Mostrar los polinomios resultantes
fprintf('\nPolinomios cúbicos por tramos:\n');
for i = 1:3
    fprintf('S%d(x) = %.6f + %.6f(x - %.1f) + %.6f(x - %.1f)^2 + %.6f(x - %.1f)^3\n', ...
        i-1, ai(i), bi(i), x(i), ci(i), x(i), di(i), x(i));
end

