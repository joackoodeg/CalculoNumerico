% F = mg - cv
% m*x'' =  m*g - c* x'
% x'' = g - (c/m)*x'
% x1 pos en x , x2 pos en y
% x3 vel en x, x4 vel en y

% g = 0 en x, g = 9,81 en y

g=9.81;
c=0.2;
m=10;

f=@(t,x) [x(3); x(4); -(c/m)*x(3); -g-(c/m)*x(4)];

y0 = [0, 30, 40, 0];
inter = [0 10];
h = 0.1;
L = 100;

[t,y]=rk4(f, inter, y0, L);

pos_y = y(:,2);
plot(t,pos_y);
axis([0 5 0 40]);

%% Mas o menos 2.5
%% Contiuamos:
pf = polyfit(t,pos_y,10); %-> Lo hacemos polinomio
pv = @(t) polyval(pf,t); % -> Evaluamos en t

%% Ahora le puedo pasar polyval a biseccion con error 1e-4
[punto, h] = biseccion(pv, 2.4, 2.6, 100, 1e-4);
printf("tiempo: %.5f", punto);

% Ahora que ya hay pos es neceasrio
% integrar hasta ese punto para obtener la dist

[td, yd] = rk4(f,[0 punto], y0, L);

pos = yd(end,1); % ultimo vaor de la primer columna
printf("\npos %.5f", pos);

%% b)
[tb, yb] = rk4(f,[0 2], x0,100);
vel_x = yb(:,3);
vel_y = yb(:,4);
y=sqrt(vel_x .^ 2 + vel_y .^ 2);
dist = trapcomp(tb,y);
disp("distancia");
disp(dist);

