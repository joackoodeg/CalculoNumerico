% La factorización LU sin pivoteo puede fallar si algún elemento diagonal A(k,k) es cero.
% Incluso si no es cero, si el elemento es muy pequeño, puede llevar a inestabilidad numérica.
% La complejidad computacional es O(n³/3) para matrices de tamaño n×n.


function A = doolittle(A)
    n = size(A, 1);

    for k = 1:n-1
        % Calcular elementos de L (debajo de la diagonal)
        for i = k+1:n
            A(i,k) = A(i,k)/A(k,k);
        end

        % Calcular elementos de U (sobre y en la diagonal)
        for i = k+1:n
            for j = k+1:n
                A(i,j) = A(i,j) - A(i,k)*A(k,j);
            end
        end
    end
end
