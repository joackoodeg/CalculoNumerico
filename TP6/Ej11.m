% Función auxiliar para calcular error relativo
rel_error = @(real, approx) abs(real - approx);

% Funciones a integrar
f1 = @(x) sin(pi * x);     a1 = 0;  b1 = 5;
f2 = @(x) 1 ./ (1 + x.^2); a2 = -5; b2 = 5;
f3 = @(x) abs(x).^(3/2);   a3 = 0;  b3 = 5;

% Soluciones de referencia con quad
I1 = quad(f1, a1, b1);
I2 = quad(f2, a2, b2);
I3 = quad(f3, a3, b3);

% Valores de L
Ls = [2, 4, 8, 16, 32, 64];

% Resultados
printf("Ejercicio 11:\n\n");
for L = Ls
    % Trapecio compuesto y Simpson compuesto
    x1 = linspace(a1, b1, L+1); y1 = f1(x1);
    x2 = linspace(a2, b2, L+1); y2 = f2(x2);
    x3 = linspace(a3, b3, L+1); y3 = f3(x3);

    I1_trap = trapcomp(x1, y1);
    I2_trap = trapcomp(x2, y2);
    I3_trap = trapcomp(x3, y3);

    if mod(length(x1), 2) == 1
        I1_simp = simpsoncomp(x1, y1);
    else
        I1_simp = NaN;
    end
    if mod(length(x2), 2) == 1
        I2_simp = simpsoncomp(x2, y2);
    else
        I2_simp = NaN;
    end
    if mod(length(x3), 2) == 1
        I3_simp = simpsoncomp(x3, y3);
    else
        I3_simp = NaN;
    end

    % Gauss compuesta
    I1_g2 = cuad_gauss_c(f1, a1, b1, L, 2);
    I1_g3 = cuad_gauss_c(f1, a1, b1, L, 3);

    I2_g2 = cuad_gauss_c(f2, a2, b2, L, 2);
    I2_g3 = cuad_gauss_c(f2, a2, b2, L, 3);

    I3_g2 = cuad_gauss_c(f3, a3, b3, L, 2);
    I3_g3 = cuad_gauss_c(f3, a3, b3, L, 3);

    % Mostrar resultados
    printf("L = %d\n", L);
    printf("f1(x) = sin(pi x):\n");
    printf("  Trapecio: %.10f, Error: %.2e\n", I1_trap, rel_error(I1, I1_trap));
    printf("  Simpson : %.10f, Error: %.2e\n", I1_simp, rel_error(I1, I1_simp));
    printf("  Gauss n=2: %.10f, Error: %.2e\n", I1_g2, rel_error(I1, I1_g2));
    printf("  Gauss n=3: %.10f, Error: %.2e\n\n", I1_g3, rel_error(I1, I1_g3));

    printf("f2(x) = 1/(1+x^2):\n");
    printf("  Trapecio: %.10f, Error: %.2e\n", I2_trap, rel_error(I2, I2_trap));
    printf("  Simpson : %.10f, Error: %.2e\n", I2_simp, rel_error(I2, I2_simp));
    printf("  Gauss n=2: %.10f, Error: %.2e\n", I2_g2, rel_error(I2, I2_g2));
    printf("  Gauss n=3: %.10f, Error: %.2e\n\n", I2_g3, rel_error(I2, I2_g3));

    printf("f3(x) = |x|^{3/2}:\n");
    printf("  Trapecio: %.10f, Error: %.2e\n", I3_trap, rel_error(I3, I3_trap));
    printf("  Simpson : %.10f, Error: %.2e\n", I3_simp, rel_error(I3, I3_simp));
    printf("  Gauss n=2: %.10f, Error: %.2e\n", I3_g2, rel_error(I3, I3_g2));
    printf("  Gauss n=3: %.10f, Error: %.2e\n\n", I3_g3, rel_error(I3, I3_g3));
end

