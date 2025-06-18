f = @(t,y) [y(2); t*log(t) + (2/t)*y(2) - (2/t^2)*y(1)];
inter = [1 2];
y0 = [1; 0];
h = 0.05;
L = (inter(2) - inter(1))/h;

[t, y] = adams_rashford(f, inter, y0, L);

%% Como obtener la diferencia
y_exact = @(t) (7/4).*t + (1/2).*(t.^3).*log(t) - (3/4).*t.^3;

% Necesito intervalo
% Con que paso? -> h

tt = inter(1):h:inter(2);
y_exact_err = y_exact(tt);
max_err = max(abs(y_exact_err - y(:,1)));
fprintf("h = %.3f -> Error máximo = %.6e\n", h, max_err);




