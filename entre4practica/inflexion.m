f = @(t,u) ([u(2);u(3);-4*sin(t) - 2*cos(t) - 4*u(3) - 5*u(2) - 2*u(1)]);

u0 = [1; 0; -1];   % y(0), y'(0), y''(0)
[t,u] = rk4(f, [0 5], u0, 1000);  % mucha resolución

y = u(:,1);      % y(t)
y1 = u(:,2);     % y'(t)
y2 = u(:,3);     % y''(t)

t_inf = [];
for i = 2:length(t)
    if y2(i-1) * y2(i) < 0  % cambio de signo en y''
        % Interpolación lineal del cero
        t1 = t(i-1);
        t2 = t(i);
        y21 = y2(i-1);
        y22 = y2(i);
        frac = y21 / (y21 - y22);
        t0 = t1 + frac * (t2 - t1);
        t_inf(end+1) = t0;
    end
end

fprintf("Puntos de inflexión en [0,5]:\n");
disp(num2str(t_inf', '%.3f'));

