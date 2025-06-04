% Definir la matriz A
A = [
     1  -2  3  0;
     3  -6  9  3;
     2   1  4  1;
     1  -2  2 -2
];

% Aplicar factorización de Doolittle con pivoteo
[Af, r] = doolittle_p(A);

% Obtener la matriz permutada P*A
PA = A(r, :);

% Extraer L1 y U
Af_ord = Af(r, :);
[L1, U] = extraer_LU(Af_ord);

% Verificar que PA = L1 * U
producto = L1 * U;
diferencia = PA - producto;
error = norm(diferencia);

% Mostrar resultados
fprintf('L1:\n'); disp(L1);
fprintf('U:\n'); disp(U);
fprintf('P*A:\n'); disp(PA);
fprintf('L1*U:\n'); disp(producto);
fprintf('Norma de la diferencia (PA - L1*U): %e\n', error);

