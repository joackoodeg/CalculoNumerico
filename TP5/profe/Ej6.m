x = [1 2 3];
y = [0 4 22/3];
df1 = 3;
dfn = 3;

[s, ds, dds] = funcion_spline(x,y,df1,dfn);
disp(y);

t = linspace(1, 3, 100);

figure();
plot(x,y,'ro'); hold on;
plot(t, s(t), 'r'); hold on;
grid on;

