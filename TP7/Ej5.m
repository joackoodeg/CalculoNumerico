f = @(t, y) t.*exp(3*t) - 2*y;
y_exacta = @(t) (t.*exp(3*t))/5 - exp(3*t)/25 + exp(-2*t)/25;

hs = [0.2, 0.1, 0.05];
errores_adams = zeros(size(hs));
errores_rk4 = zeros(size(hs));

for i = 1:length(hs)
  h = hs(i);
  L = (1 - 0)/h;

  [t_a, y_aprox_a] = adams_rashford(f, [0 1], 0, L);
  [t_rk4, y_aprox_rk4] = rk4(f, [0 1], 0, L);

  y_real_a = y_exacta(t_a);
  y_real_rk4 = y_exacta(t_rk4);

  errores_rk4(i) = max(abs(y_aprox_rk4 - y_real_a));
  errores_adams(i) = max(abs(y_aprox_a - y_real_rk4));
end

% Mostrar tabla de errores
fprintf("h\t\tError máximo Adamst\tError máximo rk4\n");
for i = 1:length(hs)
  fprintf("%.3f\t\t%.5e\t%.5e\n", hs(i), errores_adams(i), errores_rk4(i));
end

