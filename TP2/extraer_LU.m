function [L, U] = extraer_LU(Af)
    % EXTRAER_LU - Extrae manualmente las matrices L y U desde la matriz factorizada Af
    % Entrada:
    %   Af - Matriz factorizada (LU combinada)
    % Salidas:
    %   L  - Matriz triangular inferior con 1s en la diagonal
    %   U  - Matriz triangular superior

    n = size(Af, 1);
    L = eye(n);
    U = zeros(n);

    for i = 1:n
        for j = 1:n
            if i > j
                L(i,j) = Af(i,j);
            else
                U(i,j) = Af(i,j);
            end
        end
    end
end

