% predador : x2
% presa : x1
f = @(t,x) ([x(1) * (3-0.002 * x(2)); -x(2) * (0.5 - 0.0006* x(1))]);

x0 = [1600 800];
inter = [0 24];
L= (24-0)/0.1;

[t,x]=rk2(f, inter, x0, L);

x1 = x(:,1);
x2 = x(:,2);
figure();
plot(t,x1,t,x2);

figure();
plot(x1,x2);

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
