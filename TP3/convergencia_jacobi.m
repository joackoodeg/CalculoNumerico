function verificar_convergencia_jacobi(A)
  % Verifica si Jacobi converge para la matriz A
  n = size(A, 1);

  % Extraer D (diagonal), L (inferior), U (superior)
  D = diag(diag(A));
  L = tril(A, -1);
  U = triu(A, 1);

  % Calcular la matriz de iteración T = D^(-1)*(L + U)
  T = inv(D) * (L + U);

  % Calcular autovalores
  lambda = eig(T);

  % Calcular radio espectral
  rho = max(abs(lambda));

  % Mostrar resultados
  disp('Matriz de iteración de Jacobi (T):');
  disp(T);
  disp('Autovalores de T:');
  disp(lambda);
  printf("Radio espectral: %.4f\n", rho);

  if rho < 1
    disp('Jacobi CONVERGE para esta matriz.');
  else
    disp('Jacobi NO CONVERGE para esta matriz.');
  end
end

% EJEMPLO DE USO:
A = [3/4, 1/6;
     1/4, 1/4];

verificar_convergencia_jacobi(A);

