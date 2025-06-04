function [x, h] = newton(f, df, x0, kmax, tol)
    h = x0; % historial de aproximaciones
    for k = 1:kmax
        fx = f(x0);
        dfx = df(x0);
        if dfx == 0
            error('La derivada se hizo cero. No se puede continuar.');
        end
        x1 = x0 - fx / dfx;
        h(end+1) = x1;

        % === Criterios de parada ===

        % 1) Tolerancia en valor absoluto (activar esta línea si quieres usar este criterio)
        if abs(x1 - x0) < tol
            x = x1;
            return;
        end

        % 2) Tolerancia relativa (activar esta línea si quieres usar este criterio)
        %if abs(x1 - x0)/abs(x1) < tol
        %    x = x1;
        %    return;
        %end

        % 3) Tolerancia sobre el valor de f(x) (activar esta línea si quieres usar este criterio)
        %if abs(f(x1)) < tol
        %    x = x1;
        %    return;
        %end

        x0 = x1; % actualizar para la próxima iteración
    end
    x = x0; % devuelve el mejor valor encontrado si no converge antes
end

