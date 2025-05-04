function [A, r] = doolittle_p(A)
  % Devuelve:
  % A: la matriz donde L (bajo la diagonal) y U (encima de la diagonal) están guardados,
  % pero no en el orden final correcto de filas;
  % r: el vector de permutación que indica el orden real de las filas.

    n = size(A, 1);
    r = 1:n;  % Vector de permutación
    epsilon = 1e-9;

    for k = 1:n-1
        % Buscar el pivote de mayor valor absoluto
        [pmax, p] = max(abs(A(r(k:n), k)));
        p = p + k - 1;  % Ajustar índice

        if pmax < epsilon
            disp('Los posibles pivots son CERO');
            break;
        end

        % Intercambiar filas si es necesario
        if p ~= k
            r([p k]) = r([k p]);
        end

        % Calcular elementos de L
        A(r(k+1:n), k) = A(r(k+1:n), k) / A(r(k), k);

        % Actualizar submatriz
        A(r(k+1:n), k+1:n) = A(r(k+1:n), k+1:n) - ...
                            A(r(k+1:n), k) * A(r(k), k+1:n);
    end
end
