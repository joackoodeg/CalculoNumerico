%% a)

%% IMPORTANTE QUE SEA EN ESTE ORDEN: f, x, y
f = @(x) sin(2*pi*x);
x = linspace(-1, 1, 21);
y = f(x);

%% la grange
[P, ~] = Lagrange(x,y);
xx = linspace(-1, 1, 500);
yy_l = polyval(P,xx);

%% Cubic spline
[a, b, c, d] = cubic_spline_natural(x,y);
yy_sc = spline_eval(xx, x, a, b , c, d);
disp(yy_sc);

% Gráfica original
%figure(1); hold on;
%plot(xx, yy_l, 'r--'); hold on;
%plot(xx, yy_sc, 'b--'); hold on;
%plot(xx, f(xx), 'k'); hold on;
%title('Interpolación con datos originales');
%grid on;


%% b) - PERTURBADO

% IMPORTNTE OBSERVAR COMO SE TOMA EL i +1
y_p = y + ((-1).^(1:21)) * 1e-4;
[P_p, ~] = Lagrange(x, y_p);
yy_l_p = polyval(P_p, xx);

%% cubic spline
[a_p, b_p, c_p, d_p] = cubic_spline_natural(x,y_p);
yy_sc_p = spline_eval(xx, x, a_p, b_p, c_p, d_p);
disp(yy_sc_p);

% Gráfica perturbado
%figure(2); hold on;
%plot(xx, yy_l_p, 'r--'); hold on;
%plot(xx, yy_sc_p, 'b--'); hold on;
%plot(xx, f(xx), 'k'); hold on;
%title('Intperpolación con datos perturbados');
%grid on;
