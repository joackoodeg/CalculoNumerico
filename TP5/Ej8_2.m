x = [0 1 2 3 4 5 6];
y = [432 599 1012 1909 2977 4190 5961];

% a
p6 = polyfit(x,y,6);

% b
p1 = polyfit(x,y,1);

% c
p2 = polyfit(x,y,2);

% d
t = linspace(0,6,1000);

figure();
plot(x,y, 'y'); hold on;
plot(t, polyval(p6,t), 'r'); hold on;
plot(t, polyval(p1,t), 'b'); hold on;
plot(t, polyval(p2,t), 'g'); hold on;
grid on;

% errores
disp("errores cuadraticos")
e_p6 = mean(y - polyval(p6, x).^2);
e_p1 = mean(y - polyval(p1, x).^2);
e_p2 = mean(y -polyval(p2, x).^2);
disp(e_p6);
disp(e_p2);
disp(e_p1);

% MEJOR aparten -> p6

%% e
x10_p6 = polyval(p6,10);
x10_p2 = polyval(p2,10);
x10_p1 = polyval(p1,10);
disp("prediccion 10: ");
disp(x10_p6);
disp(x10_p2);
disp(x10_p1);

%% f errore relativos

real = 14900;
err6 = abs(x10_p6 - real)/real;
err1 = abs(x10_p1 - real)/real;
err2 = abs(x10_p2 - real)/real;
disp("error relatvo respecto a 14900");
disp(err6);
disp(err2);
disp(err1);











