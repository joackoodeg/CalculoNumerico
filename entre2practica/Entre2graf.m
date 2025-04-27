format long g;
clc;

K = 0.04;

%----------------------A----------------------%
pt=3.5;
f = @(x) ((x./(1-x)).*sqrt((2*pt)./(2+x))) - K;

%Grafica
t=linspace(-1.99,6,200);
hold on;
y = @(t) t.*0;
grid on;
plot(t,y(t),'-k');
