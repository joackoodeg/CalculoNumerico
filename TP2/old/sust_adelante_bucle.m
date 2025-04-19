function x = sust_adelante_bucle(A, b)
    % SUST_ADELANTE - Realiza sustitución hacia adelante para resolver un sistema triangular inferior
    %
    % Sintaxis:
    %   x = sust_adelante(A, b)
    %
    % Entradas:
    %   A - Matriz triangular inferior (tamaño n x n)
    %   b - Vector de términos independientes (tamaño n x 1)
    %
    % Salidas:
    %   x - Vector solución del sistema Ax = b
    %
    % Descripción:
    %   Esta función resuelve un sistema de ecuaciones lineales Ax = b donde
    %   A es una matriz triangular inferior, mediante el método de sustitución
    %   hacia adelante. El algoritmo comienza desde la primera ecuación y avanza
    %   hacia abajo, sustituyendo los valores ya calculados.

    % Obtener el tamaño del sistema
    n = length(b);

    % Inicializar el vector solución
    x = zeros(size(b));

    % Calcular la primera incógnita
    % x(1) = b(1) / a(1,1)
    x(1) = b(1) / A(1,1);

    % Resolver las demás incógnitas de arriba hacia abajo
    for i = 2:n
        % Inicializar la suma de términos conocidos
        suma = 0;

        % Sumar los productos a(i,j)*x(j) para j < i
        for j = 1:i-1
            suma = suma + A(i,j) * x(j);
        end

        % Calcular x(i) = (b(i) - suma) / a(i,i)
        x(i) = (b(i) - suma) / A(i,i);
    end
end
