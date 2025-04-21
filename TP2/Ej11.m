% Matriz A
A = [
    1, 1 + 0.5e-15, 3;
    2, 2, 20;
    3, 6, 4
];
n = size(A, 1);

disp("Matriz original A:");
disp(A);

%% --- Factorización sin pivoteo ---
A_np = A;  % Copia de A para no modificarla
A_fact_np = doolittle(A_np);  % Asume que tenés esta función definida

L_np = tril(A_fact_np, -1) + eye(n);
U_np = triu(A_fact_np);

disp("Factorización sin pivoteo (A = L*U):");
disp("L:");
disp(L_np);
disp("U:");
disp(U_np);

% Residuo sin pivoteo
residuo_np = A - L_np * U_np;
disp("Residuo sin pivoteo A - L*U:");
disp(residuo_np);

%% --- Factorización con pivoteo parcial ---
[A_fact_p, r] = doolittle_p(A);  % Función con pivoteo parcial
Af_p = A_fact_p(r, :);
L_p = tril(Af_p, -1) + eye(n);
U_p = triu(Af_p);

PA = A(r, :);
residuo_p = PA - L_p * U_p;

disp("Factorización con pivoteo (PA = L*U):");
disp("L:");
disp(L_p);
disp("U:");
disp(U_p);

disp("Residuo con pivoteo PA - L*U:");
disp(residuo_p);

