f = @(t,y)([y(2);t*log(t) + 2/t * y(2) - 2/t^2 * y(1)]);

inter = [1 2];
y0 = [1; 0];
h = 0.05;
L = (2-1)/h;
[t,y] = adams_rashford(f, inter, y0, L);

y_exact = @(t) (7/4).*t + (1/2).*(t.^3).*log(t) - (3/4).*t.^3;

t1 =1:h:2;

y_exact_err = y_exact(t1);
max_err = max(abs(y_exact_err - y(:,1)));
fprintf("h = %.3f -> Error máximo = %.6e\n", h, max_err);

figure();
plot(t1,y(:,1),'b');
figure();
plot(t1,y_exact(t1), 'r');
