f = @(x) x^3 + x - 4;
[x, h] = biseccion(f, 1, 4, 100, 1e-3);
disp(['Raíz aproximada: ', num2str(x)]);
disp(['Iteraciones: ', num2str(length(h))]);

