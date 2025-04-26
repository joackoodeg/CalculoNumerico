% Definimos la función y su derivada
f = @(x) x .* (log(x + 3) - 17) - 1;
df = @(x) log(x + 3) - 17 + x ./ (x + 3);

% Paso 1: Encontrar un intervalo donde está el cero
a = 0;
b = 1;

while f(a)*f(b) > 0
    b = b * 2;
endwhile

disp(["Intervalo encontrado: [", num2str(a), ", ", num2str(b), "]"]);

kmax = 100;

% Paso 2: Bisección con error absoluto < 1e-2
[x_bis, h_bis] = biseccion(f, a, b, kmax, 1e-2);
disp("Aproximación por bisección:");
disp(x_bis);

% Paso 3: Newton partiendo de x_bis con error relativo < 1e-12
[x_newt, h_newt] = newton(f, df, x_bis, kmax, 1e-12);
disp("Aproximación final con Newton:");
disp(x_newt);

disp(["Iteraciones bisección: ", num2str(length(h_bis))]);
disp(["Iteraciones Newton: ", num2str(length(h_newt))]);
