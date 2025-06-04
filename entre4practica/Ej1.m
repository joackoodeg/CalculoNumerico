format long;
g = 9.81;
R = 6373002;

f = @(t,x) ([x(2); (-g*R^2/(x(1) + R).^2)]);

% y0 = [y(0), y'(0), y''(0)]

[t,y]=rk4(f, [0 180], [0; 1409.34], 1000);

% a
v_max = y(end,2);
disp(v_max);

[altura_max, idx] = max(y(:, 1));
tiempo_ascenso = t(idx);
disp(altura_max);
disp(tiempo_ascenso);
