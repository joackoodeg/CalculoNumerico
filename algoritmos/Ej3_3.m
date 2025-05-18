% Frecuencias dadas
f1 = 440;
f2 = 660;
f3 = 1100;
f4 = 5;
f5 = 8;

% Tiempos y valores medidos
t = [0, 0.0025, 0.005, 0.0075, 0.01];
s_t = [2.1004, 4.3702, 5.1745, -0.7222, 0.9249];

% Construir la matriz del sistema
A = zeros(5, 5);

for i = 1:5
    A(i, 1) = sin(2*pi*f1*t(i));
    A(i, 2) = sin(2*pi*f2*t(i));
    A(i, 3) = sin(2*pi*f3*t(i));
    A(i, 4) = cos(2*pi*f4*t(i));
    A(i, 5) = sin(2*pi*f5*t(i));
end

% Resolver el sistema de ecuaciones lineales
amplitudes = gauss_elim(A,  s_t');

% Mostrar resultados
disp('Amplitudes:');
disp(['A1 = ', num2str(amplitudes(1))]);
disp(['A2 = ', num2str(amplitudes(2))]);
disp(['A3 = ', num2str(amplitudes(3))]);
disp(['A4 = ', num2str(amplitudes(4))]);
disp(['A5 = ', num2str(amplitudes(5))]);

% Calcular el residuo para verificar la calidad del ajuste
residuo = norm(A*amplitudes - s_t');
disp(['Residuo: ', num2str(residuo)]);

% Calcular y mostrar los valores ajustados
s_ajustados = A*amplitudes;
disp('Valores ajustados:');
for i = 1:5
    disp(['s(', num2str(t(i)), ') = ', num2str(s_ajustados(i)), ' (Original: ', num2str(s_t(i)), ')']);
end
