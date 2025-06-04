% Obseervando x'1 se observa que x1 disminuye a medida que x2 aumenta
% Ademas si x2 = 0 entonces x'1  = 3x1, lo que implica que xx1 crece de manera exponencial sin x2
% Esto sugiere que x1 no necesita x2 para sobrevidir
% -> entonces x1 es la presa

% Observando x'2 El crecimiento de x2 aumenta si x1 es lo suficientemente grande
% Si x1=0 entonces x'2 = -0.5x2, es decir, disminuye exponencialmente.
% -> Sin x1, x2 se extingue
% -> x2 es depredador

% SE USA RK4 PORQUE :
% Euler : Orden 1
% RK2 : Orden 2
% RK4: Orden 4

f = @(t, x) ([x(1)*(3-0.002*x(2));-x(2)*(0.5 - 0.0006*x(1))]);

x0 = [1600; 800];
inter = [0 24];
L = (24-0)/0.1; % h = 0.1

[t,x_a]= rk4(f,inter,x0,L);

x1 = x_a(:,1);
x2 = x_a(:,2);

figure();
plot(t,x1,t,x2);
legend("presa","preadador");

figure();
plot(x1,x2,1600,800, 'ko');
legend("presas vs predadores");
xlabel("presas");
ylabel("predadores");

%%% EXTRA; PUNTO DE EQUILIBRIO
%% x'1= x'2 = 0
%% x'1 = x1(a-bx2)
%% x'2 = x2(c-dx1)
%% x2 = a/b
%% x1 = c/d

x2_estable = 3/0.002;
x1_estable = 0.5 / 0.0006;
hold on;
plot(x1_estable, x2_estable, 'ro');


