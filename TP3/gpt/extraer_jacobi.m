function [L, D, U] = extraer_jacobi(A)
    % EXTRAER_JACOBI - Extrae las matrices L, D y U para el método de Jacobi
    % Entradas:
    %   A - Matriz del sistema
    % Salidas:
    %   L - Matriz triangular inferior estricta (sin diagonal)
    %   D - Matriz diagonal
    %   U - Matriz triangular superior estricta (sin diagonal)

    n = size(A, 1);
    L = zeros(n);
    D = zeros(n);
    U = zeros(n);

    for i = 1:n
        for j = 1:n
            if i > j
                L(i,j) = A(i,j);
            elseif i < j
                U(i,j) = A(i,j);
            else % i == j
                D(i,j) = A(i,j);
            end
        end
    end
end
