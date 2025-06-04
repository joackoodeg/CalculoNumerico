f = @(t,y) -y + sin(t) + cos(t);

hs = [1/10, 1/20, 1/40 ,1/80 ,1/160 ,1/320];

res_euler = zeros(size(hs));
res_rk2 = zeros(size(hs));
res_rk4 = zeros(size(hs));
inter = [0 2];

for i=1: length(hs)
  h = hs(i);
  L = (2-0)/h;
  [~, ye] = euler(f,inter,0,L);
  [~, yrk2] = rk2(f,inter,0,L);
  [~, yrk4] = rk4(f,inter,0,L)

  res_euler(i) = ye(end);
  res_rk2(i) = yrk2(end);
  res_rk4(i) = yrk4(end);
endfor

% Mostrar tabla de resultados
fprintf('   h\t\tEuler\t\tRK2\t\tRK4\n');
for i = 1:length(hs)
    fprintf('%.5f\t%.6f\t%.6f\t%.6f\n', hs(i), res_euler(i), res_rk2(i), res_rk4(i));
end
