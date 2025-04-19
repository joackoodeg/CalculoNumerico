% Función genérica para sustitución hacia atrás
function x = sust_atras_bucle(A, b)
    % Resuelve un sistema Ax = b donde A es triangular superior
    % Entradas:
    %   A: matriz de coeficientes triangular superior
    %   b: vector de términos independientes
    % Salida:
    %   x: vector solución del sistema

    n = length(b);
    x = zeros(n, 1);

    % Calculamos la última incógnita
    x(n) = b(n) / A(n, n);

    % Calculamos las demás incógnitas de abajo hacia arriba
    for i = n-1:-1:1
        suma = 0;
        for j = i+1:n
            suma = suma + A(i, j) * x(j);
        end
        x(i) = (b(i) - suma) / A(i, i);
    end
end
