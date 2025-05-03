P = @(x) 230 * x.^4 + 18 * x.^3 + 9 * x.^2 - 221 * x - 9;
t = linspace(-1, 1, 1000);
y_identity = @(x) x;

figure();
plot(t, P(t), 'b', t, y_identity(t), 'r--');
legend('P(x)', 'y = x');
xlabel('x');
ylabel('y');
title('Intersección de P(x) con y = x');
grid on;
axis([-1 1 -1 1]); % ajustás la escala para ver bien la intersección

f = @(x) 230 * x.^4 + 18 * x.^3 + 9 * x.^2 - 222 * x - 9;
df = @(x)  4 * 230 * x.^3 + 3 * 18 * x.^2 + 2 * 9 * x.^1 - 222;

% Metodos de octave
%x1_O = fzero(f, -0.9);
%x2_O = fzero(f, 0.9);

%printf("x= %.6f", x1_O, x2_O);

kmax=1000;
tol = 1e-6;

[x1, h1] = newton(f, df, -0.05, kmax, tol)
[x2, h2] = newton(f, df, 0.94, kmax, tol)

printf("x= %.6f", x1, x2);

