function x = gauss_elim(A, b)
    % GAUSS_ELIM - Resuelve el sistema de ecuaciones Ax = b mediante eliminación de Gauss
    %
    % Sintaxis:  x = gauss_elim(A, b)
    %
    % Entradas:
    %    A - Matriz de coeficientes (n x n)
    %    b - Vector de términos independientes (n x 1)
    %
    % Salidas:
    %    x - Vector solución (n x 1)

    % Verificar dimensiones
    [m, n] = size(A);
    if m ~= n
        error('La matriz A debe ser cuadrada');
    end
    if length(b) ~= n
        error('El vector b debe tener la misma longitud que el número de filas de A');
    end

    % Crear la matriz aumentada [A|b]
    A = [A, b];

    % Fase de eliminación - transformar a forma triangular superior
    for k = 1:n-1
        % Comprobar si el pivote es cero
        if abs(A(k,k)) < eps
            error('Pivote nulo encontrado. Considere usar pivoteo');
        end

        for i = k+1:n
            factor = A(i,k) / A(k,k);

            % Actualizar la fila i
            for j = k:n+1
                A(i,j) = A(i,j) - factor * A(k,j);
            end
        end
    end

    if (A(n,n)==0)
        disp('no hay sol. unica')
    endif

    % Fase de sustitución hacia atrás
    %b= A(:,end); % Todas las filas, de la ultima columna
    %A=A(:, 1:end-1); % Todas las filas desde la 1 hasta la penultima
    %x = sust_atras(A, b);

    x=sust_atras_aum(A);
end
