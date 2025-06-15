x = [0 0.2 0.4 0.6 0.8 1 1.2 1.4 1.6 1.8 2];
y = [4.24 4.44 4.91 5.44 5.65 5.33 3.91 1.86 0.07 -1.16 -1.94];
z = cos((pi .* x) ./2);

%% a)
p = polyfit(z,y,2); % -> Polinomio en z

%% Polyfit devuelve los coef de mas alto grado a menor

a0 = p(3); disp(a0);
a1 = p(2); disp(a1);
a2 = p(1); disp(a2);


eval = cos((pi * 1)/2);
y_exact = polyval(p,eval);
err = abs(5.33 - y_exact);
printf("error : .%5f", err);
