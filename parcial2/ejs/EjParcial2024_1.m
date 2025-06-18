format long;

t = [1 2 3 4 5 6 7 8 9 10 11 12]; % meses
y = [26.1 25.6 23.5 20.3 17.3 13.9 13.4 15 17.1 20.7 22.1 25.2];

f1 = t;
f2 = ones(size(t));
f3 = @(t) sin((pi/6)* t);
f4 = @(t) cos((pi/6) * t);

%x = []
%y = []
%M = [f1' f2' f3']
%c = M \ y'

M = [f1(t)' f2(t)' f3(t)' f4(t)'];
w = M \ y';

a = w(1);
b = w(2);
c = w(3);
d = w(4);

printf("a= %.5f\n", a);
printf("b= %.5f\n", b);
printf("c= %.5f\n", c);
printf("d= %.5f\n", d);

%%% b RARO EL CUADRATICO
yy_modelo = @(t) a.*t + b + c.*sin((pi/6) .* t)  + d.*cos((pi/6) .* t);
y_modelo = yy_modelo(t);

error_cuad = norm(y-y_modelo, 2);
printf("error= %.5f\n", error_cuad);


%% c
%enero 2020 -> t= 13;
yy_modelo = @(t) a.*t + b + c.*sin((pi/6) .* t)  + d.*cos((pi/6) .* t);
y_enero = yy_modelo(13);
printf("y enero : %.3f\n", y_enero);

error_relativo = abs(y_enero-27)/27;
printf("error relativo: %.5f", error_relativo);
