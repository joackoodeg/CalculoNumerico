x = [0 1 2 3 4 5 6];
y = [432 599 1012 1909 2977 4190 5961];

p6 = polyfit(x,y,6);
disp(polyout(p6));
printf("\n");

p1 = polyfit(x,y,1);
disp(polyout(p1));
printf("\n");

p2 = polyfit(x,y,2);
disp(polyout(p2));
printf("\n");

t = linspace(0,6,100);

plot(t, polyval(p6,t), t, polyval(p1,t) ,t, polyval(p2,t));

disp("errores cuadraticos")
e_p6 = mean(y - polyval(p6, x).^2);
e_p1 = mean(y - polyval(p1, x).^2);
e_p2 = mean(y -polyval(p2, x).^2);
disp(e_p6);
disp(e_p2);
disp(e_p1);


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




