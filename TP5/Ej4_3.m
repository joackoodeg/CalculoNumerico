# Datos del problema
x = [0 1 2];
y = [1 2 2];  # porque S(1) = 2 y queremos que siga continuo, usamos S(2)=2 (luego validamos)

[a, b, c, d] = cubic_spline_natural(x, y);

# Mostramos los coeficientes del tramo [1,2]
printf("Coeficientes en el tramo [1,2]:\n");
printf("b = %f\n", b(2));
printf("c = %f\n", c(2));
printf("d = %f\n", d(2));
