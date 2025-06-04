function [x, it, r_h] = jacobi(A, b, x0, maxit, tol)
    % Inicialización
    n = length(b);
    x = x0;
    r_h = zeros(maxit, 1);

    % Extraer la matriz diagonal y las partes triangulares
    [L, D, U] = extraer_jacobi(A);
    D_inv = inv(D);

    % Iteraciones
    for it = 1:maxit
        x_old = x;

        % Calcular nueva aproximación: x = D^(-1) * (b - (L+U)*x_old)
        x = D_inv * (b - (L+U)*x_old);

        % Calcular el residuo relativo
        r_h(it) = norm(x - x_old, inf) / norm(x, inf);

        % Verificar convergencia
        if r_h(it) < tol
            r_h = r_h(1:it);
            return;
        end
    end

    % Si no convergió
    r_h = r_h(1:it);
end
