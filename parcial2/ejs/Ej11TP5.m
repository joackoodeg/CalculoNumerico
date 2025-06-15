 % Tiempo en horas (cada 12 minutos = 1/5 h)
t = (0:25) * (1/5);

% Velocidades medidas (en km/h)
v = [0.61255, 1.40101, 2.69013, 3.40985, 3.95361, 3.59041, ...
     3.09119, 2.71147, 2.01397, 1.35229, 1.09930, 1.30715, ...
     1.99290, 3.46081, 5.34487, 7.50176, 9.35324, 11.22945, ...
     12.76212, 13.99448, 14.41532, 14.47064, 13.91045, ...
     13.01681, 12.18537, 11.26826];
# A

%x = []
%y = []
%M = [f1' f2' f3']
%c = M \ y'
f1 = @(t) sin(2 .* t);
f2 = @(t) t .^ 2;
f3 = @(t) 2 .^ t;
f4 = @(t) ones(size(t));

M = [f1(t)' f2(t)' f3(t)' f4(t)' ];
c = M \ v';

printf("\n(a) Coeficientes del modelo v(t) = c1*sin(2t) + c2*t^2 + c3*t^3 + c4:\n");
printf("c1 = %.4f\nc2 = %.4f\nc3 = %.4f\nc4 = %.4f\n", c(1), c(2), c(3), c(4));

%% Prediccion:

F = @(t) c(1) .* f1(t) + c(2) .* f2(t) + c(3) .* f3(t) + c(4) .* f4(t);
v_6 = F(6);
disp(v_6);

% con poly:
p6 = polyfit(t,v,6);
v_6_poly = polyval(p6,6);
disp(v_6_poly);

% grafica
tt = linspace(0,5,1000);
plot(t,v,'ko'); hold on;
plot(tt, F(tt), 'b');

