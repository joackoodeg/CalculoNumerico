function [x, it, r_h] = gaussseidel(A, b, x0, maxit, tol)
    % Inicialización
    n = length(b);
    x = x0;
    r_h = zeros(maxit, 1);

    % Extraer las matrices para el método
    [L, D, U] = extraer_jacobi(A);
    DL_inv = inv(D + L);

    % Iteraciones
    for it = 1:maxit
        x_old = x;

        % Calcular nueva aproximación: x = (D+L)^(-1) * (b - U*x_old)
        x = DL_inv * (b - U*x_old);

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
