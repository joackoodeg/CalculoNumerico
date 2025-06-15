%% y4 = -4y3 - 5y2 -2y1 - 4sent - 2cost

f = @(t,y)([y(2);y(3);-4*sin(t)-2*cos(t)-4*y(3)-5*y(2)-2*y(1)]);
y0 = [1; 0; -1];

inter = [0 5];
h = 0.01;
L = (inter(2) - inter(1))/h;

[t,y]=rk4(f, inter, y0, L);


y_prima = y(:,3);
plot(t,y_prima, 'b'); hold on;
plot(t, zeros(size(t)), 'r');
