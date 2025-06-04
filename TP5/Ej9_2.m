x = [-1 0 1 2];
y = [-1.1 -0.4 -0.9 -2.7];

yy = log(-y);
coef = polyfit(x,yy,2);

a = coef(1);
b = coef(2);
c = coef(3);

x_ajust = linspace(-1.5, 2.5, 1000);
y_ajust= -exp(a .* (x_ajust .^ 2) + b .* x_ajust + c);

figure();
plot(x_ajust,y_ajust, 'r'); hold on;
plot(x, y, 'ro'); hold on;
grid on;


