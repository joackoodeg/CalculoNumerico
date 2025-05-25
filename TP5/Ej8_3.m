x=[0 1 2 3 4 5 6];
y=[432 599  1012 1909 2977 4190 5961];
p6 = polyfit(x,y,6);
p1 = polyfit(x,y,1);
p2 = polyfit(x,y,2);
t= linspace(0,6,1000);

figure();
plot(x,y,'ro'); hold on;
plot(t, polyval(p6,t), 'r'); hold on;
plot(t, polyval(p1,t), 'b'); hold on;
plot(t, polyval(p2,t), 'y'); hold on;

% Prediccion:
p6_10 = polyval(p6,10);
p2_10 = polyval(p2,10);
p1_10 = polyval(p1,10);
disp("Predicciones");
disp(p6_10); disp(p2_10); disp(p1_10);

% Estimacion
real = 14900;
e_p6 = abs(p6_10 - real)/real;
e_p1 = abs(p1_10 - real)/real;
e_p2 = abs(p2_10 - real)/real;
disp("errores");
disp(e_p6); disp(e_p2); disp(e_p1);
