format long g;
clc;

K = 0.04;

%----------------------A----------------------%
pt=3.5;
f = @(x) ((x./(1-x)).*sqrt((2*pt)./(2+x))) - K;

%Grafica
figure(1);
t=linspace(0,1,1000);
hold on;
grid on;
plot(t,f(t));
ylim([-1,1]);
title("a)");

%----------------------B----------------------%
x=0.02;
g = @(p) ((x./(1-x)).*sqrt((2*p)./(2+x))) - K;

figure(2);
w=linspace(0,5,1000);
hold on;
grid on;
plot(w,g(w));
title("b)");
