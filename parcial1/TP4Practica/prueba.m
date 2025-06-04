P = @(x) 230 * x.^4 + 18 * x.^3 + 9 * x.^2 - 221 * x - 9;
t = linspace(-1, 1, 1000);
y = @(x) x;

figure();
plot(t, P(t), t, y(t));
grid on;
axis([-1 1 -1 1]); % ajustás la escala para ver bien la intersección


