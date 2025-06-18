f = @(t, x) [ -t * x(2); t*x(1) - t*x(2)];
h = 0.05;
inter = [0 20];
L = (inter(2) -inter(1))/h;
y0 = [1; -1];

[t,y] = euler(f,inter,y0,L);

plot(y(:,1), y(:,2),'g');
