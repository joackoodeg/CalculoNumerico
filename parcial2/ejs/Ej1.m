f = @(x) [0 .* x, 0 .* x, -20 .* exp(-10 .* (x - 0.7) .^ 2)];

inter = [0 1];
yc = [5 6];

L = 40;

[x,y]=dif_fin_dir(f,inter,yc,L);

plot(x, y, 'b');
xlabel("x"); ylabel("u(x)");
grid on;

