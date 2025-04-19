function x = sust_atras_aum(Ab)
    % SUST_ATRAS - Realiza sustitución hacia atrás para resolver un sistema triangular superior
    %
    % Sintaxis:
    %   x = sust_atras(Ab)
    %
    % Entradas:
    %   Ab - Matriz aumentada [A|b] donde A es triangular superior y b es el vector
    %        de términos independientes (Ab debe ser de tamaño n x (n+1))
    %
    % Salidas:
    %   x - Vector solución del sistema Ax = b
    %
    % Descripción:
    %   Esta función resuelve un sistema de ecuaciones lineales Ax = b donde
    %   A es una matriz triangular superior, mediante el método de sustitución
    %   hacia atrás. El algoritmo comienza desde la última ecuación (que solo
    %   tiene una incógnita) y va subiendo hasta la primera, sustituyendo los
    %   valores ya calculados.

    % Obtener el tamaño del sistema
    % ~ -> no interesa
    [n, ~] = size(Ab);

    % Inicializar el vector solución
    x = zeros(n, 1);

    % Calcular la última incógnita
    % x(n) = b(n) / a(n,n)
    x(n) = Ab(n, n+1) / Ab(n, n);

    % Resolver las demás incógnitas de abajo hacia arriba
    for i = n-1:-1:1
        % Inicializar la suma de términos conocidos
        suma = 0;

        % Sumar los productos a(i,j)*x(j) para j > i
        for j = i+1:n
            suma = suma + Ab(i, j) * x(j);
        end

        % Calcular x(i) = (b(i) - suma) / a(i,i)
        x(i) = (Ab(i, n+1) - suma) / Ab(i, i);
    end
end
