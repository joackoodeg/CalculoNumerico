function [x, h] = secante(f, xmin, xmax, kmax, tol)
    h = [xmin, xmax]; % historial de aproximaciones
    for k = 1:kmax
        fxmin = f(xmin);
        fxmax = f(xmax);
        if (fxmax - fxmin) == 0
            error('División por cero en la secante.');
        end

        xnew = xmax - fxmax * (xmax - xmin) / (fxmax - fxmin);
        h(end+1) = xnew;

        % ----------- CRITERIOS DE CORTE ----------------

        % 1. Criterio absoluto
        if abs(xnew - xmax) < tol
            x = xnew;
            return;
        end

        % 2. Criterio relativo
        % if abs((xnew - xmax) / xnew) < tol
        %     x = xnew;
        %     return;
        % end

        % 3. Criterio por residuo
        % if abs(f(xnew)) < tol
        %     x = xnew;
        %     return;
        % end

        % -------------------------------------------------

        xmin = xmax;
        xmax = xnew;
    end
    x = xmax;
end

