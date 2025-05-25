x = [0.0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0]';
y = [4.24 4.44 4.91 5.44 5.65 5.33 3.91 1.86 0.07 -1.16 -1.94]';

f2 = @(x) cos(pi * x / 2);
f3 = @(x) cos(pi * x / 2) .^ 2;
f1= @(x) ones(size(x));

M = [f1(x), f2(x), f3(x)];

A = M' * M;
b = M' * y;
c = A \ b;

% Mostrar los coeficientes con 2 decimales
printf("a0 = %.2f\n", c(1));
printf("a1 = %.2f\n", c(2));
printf("a2 = %.2f\n", c(3));


%% b)
f_1 = c(1) + c(2) * cos(pi * 1 / 2) + c(3) * cos(pi * 1 / 2)^2;
err = abs(5.33 - f_1);
disp(err);
