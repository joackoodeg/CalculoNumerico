clc;
p = 3.5;
K = 0.04;

%f = @(x) ( x ./ (1 - x) ) .* sqrt((2 .* p) ./ (2 + x)) - K;

%t = linspace(0,10,1000);
%figure();
%plot(t,f(t));
%axis ([0 0.5 -1 1]);
%grid on;

%[x_1, h_1] = secante(f, 0, 0.1, 100000, 1e-8);

%printf("x1= %.8f", x_1);

x=0.02;
f = @(pt) ( x ./ (1 - x) ) .* sqrt((2 .* pt) ./ (2 + x)) - K;

t = linspace(0,10,1000);
figure();
plot(t,g(t));
axis ([2 6 -1 1]);
grid on;

[x_2, h_2] = secante(f, 0, 0.1, 100000, 1e-8);

printf("x2= %.8f", x_2);

