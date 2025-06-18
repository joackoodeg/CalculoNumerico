% presa: aquella q vive sin el predador
% presa: x1 , predador: x2

f = @(t,x) [x(1)*(3-0.002*x(2)); -x(2) * (0.5-0.0006*x(1))];
y0 = [1600 800];
inter = [0 100];
L = (inter(2)-inter(1))/h;

[t,y]=rk4(f, inter, y0, L);

figure(1);
title("predador vs tiemop");
plot(t, y(:,2));

figure(2);
title("presa vs tiempo");
plot(t, y(:,1));

figure(3);
title("presa vs predador");
plot(y(:,1),y(:,2));


%%% EXTRA; PUNTO DE EQUILIBRIO
%% x'1= x'2 = 0
%% x'1 = x1(a-bx2)
%% x'2 = x2(c-dx1)
%% x2 = a/b
%% x1 = c/d


%% -> Mirando la formula: a= 3, b = 0.002 , c = 0.5, d = 0.0006

x2_eq = 3 / 0.002;
x1_eq = 0.5 / 0.0006;
hold on;

plot(x1_eq,x2_eq, 'ro');
