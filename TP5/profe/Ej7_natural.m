% etapa 1
t1 = [0 1 2];
x1 = [0 2 6];
y1 = [0 4 6];

% etapa 2
t2 = [2 3 4];
x2 = [6 3 0];
y2 = [6 2 0];

%% x vs t
[sx1, dsx1, ddsx1] = funcion_spline(t1,x1);
[sx2, dsx2, ddsx2] = funcion_spline(t2,x2);

tt1 = linspace(0,2,100);
tt2 = linspace(2,4,100);

figure();
plot(tt1, sx1(tt1), 'r'); hold on;
plot(tt2, sx2(tt2), 'b'); hold on;
xlabel('Datos Tiempo');
ylabel('Posicion X');

%% y vs t
[sy1, dsy1, ddsy1] = funcion_spline(t1,y1);
[sy2, dsy2, ddsy2] = funcion_spline(t2,y2);

figure();
plot(tt1, sy1(tt1), 'r'); hold on;
plot(tt2, sy2(tt2), 'b'); hold on;
xlabel('Datos Tiempo');
ylabel('Posicion Y');

%% x vs y
figure();
plot(sx1(tt1), sy1(tt1), 'r'); hold on;
plot(sx2(tt2), sy2(tt2), 'b'); hold on;
xlabel('X');
ylabel('Y');





