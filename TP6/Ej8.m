format long;

printf("\n--- Ejercicio 8.a: Grado de precisión de cuadratura de Gauss con n = 2 ---\n");
a = -1; b = 1; L = 1; n = 2;

for k = 0:6
  f = @(x) x.^k;
  I_gauss = cuad_gauss_c(f, a, b, L, n);
  I_real = integral(f, a, b);
  err = abs(I_gauss - I_real);
  printf("k = %d | I_real = %.10f | I_gauss = %.10f | Error = %.2e\n", k, I_real, I_gauss, err);
end

% ------------------ EJERCICIO 8.b ------------------

printf("\n--- Ejercicio 8.b: Determinar coeficientes para cuadratura exacta hasta grado 2 ---\n");

% Sistema A * c = b
A = [
  1 1 1;      % f(x) = 1
 -1 0 1;      % f(x) = x
  1 0 1       % f(x) = x^2
];

b = [
  2;          % ∫_{-1}^{1} 1 dx
  0;          % ∫_{-1}^{1} x dx
  2/3         % ∫_{-1}^{1} x^2 dx
];

c = A\b;

printf("Coeficientes:\n");
printf("c0 = %.4f (multiplica f(-1))\n", c(1));
printf("c1 = %.4f (multiplica f(0))\n", c(2));
printf("c2 = %.4f (multiplica f(1))\n", c(3));

