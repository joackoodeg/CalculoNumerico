% y'' = - g/l * sin(y)
g = 9.81;
l= 2;

f = @(t,y) [y(2); - g/l * sin(y(1))];

y0 = [0; 1];

[t,y]=rk4(f, [0 10], y0, 100);

pos=y(end,1);
printf("%.5f", pos);


