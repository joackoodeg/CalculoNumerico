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
        if abs(xnew - xmax) < tol
            x = xnew;
            return;
        end
        xmin = xmax;
        xmax = xnew;
    end
    x = xmax;
endfunction
