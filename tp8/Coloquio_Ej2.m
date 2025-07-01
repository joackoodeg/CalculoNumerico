clc;
l = @(t) 10 + cos(t + 0.02);
dl = @(t) -sin(t + 0.02);
g = 9.81;

% o'' = -2* l * l' * o' / l^2 - g * l * o /l^2

p = @(t) -2.* dl(t) ./ (l(t));
q = @(t) -g ./ (l(t));
r = @(t) zeros(size(t));

f = @(t) [p(t), q(t), r(t)];

inter = [0, 5];
yc = [0.5, 0];
L = 5000;

[t, theta] = dif_fin_dir(f, inter, yc, L);
h = t(2) - t(1);
theta_prime_0 = (theta(2) - theta(1)) / h;
fprintf('La velocidad inicial= %.4f\n', theta_prime_0);

%% b
[ymax, idx] = max(abs(theta));
printf("max amplitud= %.3f\n", ymax);
printf("a los= %.3f\n", t(idx));

%% c
index = find (t >= 2.5);
disp(theta(index(1)));
