x = linspace(1,3,3);

y = 1 ./ (4*x);

p = polyfit(x,y,2);

x_eval = 1.7;
y_inter = polyval(p,x_eval);

y_real = 1 / (4 * x_eval);

error_real = abs(y_real - y_inter);
printf("error real %.4f", error_real);
