format long;

f = @(eta, y) [y(2); y(3); -0.5*y(1)*y(3)];
y0 = [0; 0; 0.332];
h = 0.01;
L = (5-0)/h;
[t, y] = rk4(f, [0 5], y0, L);

f1 = y(:,2);  % f'(eta)
eta = t;

target = 0.99;
tol = 1e-4;
eta_99 = NaN;

for i = 2:length(f1)
    anterior = f1(i-1);
    actual = f1(i);

    if abs(actual - target) < tol || abs(anterior - target) < tol
        eta_99 = eta(i);
        break
    end
end

%plot(eta,f1);
%hold on;
%plot(eta_99,0.99,'ro');
%axis([4 5 0.9 1]);

fprintf("η_99 = %.5f\n", eta_99);

%% b)
U = 2;
v = 1.5e-5;
x = 0.4;

delta = eta_99 * sqrt(v * x / U);

fprintf("Espesor= %.6f\n", delta);

%% c)
f1 = y(:,2);
% integral  hasta eta_99
qint = trapcomp(eta(1:i), f1(1:i));

factor = sqrt(1.5e-5 * 2 * 0.4);
q = factor * qint;

fprintf("Caudal = %.6f\n", q);

