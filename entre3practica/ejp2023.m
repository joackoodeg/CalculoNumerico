x = [0 0.2 0.4 0.6 0.8 1 1.2 1.4 1.6 1.8 2];
y = [4.24 4.44 4.91 5.44 5.65 5.33 3.91 1.86 0.07 -1.16 -1.94];
z = cos((pi .* x) ./2);

%% a)

p = polyfit(z,y,2); % -> Polinomio en z
a2= p(1); % = cos^2(pi x /2)
a1 = p(2); % = cos(pi x /2)
a0 = p(3); % = c

printf("a0 = %.2f\n", a0);
printf("a1 = %.2f\n", a1);
printf("a2 = %.2f\n", a2);


%% b)
eval = cos(pi * 1/ 2); % -> porque el polinomio esta en z
x_p = polyval(p, eval);
err = abs(5.33 - x_p);
disp("error"); disp(err);
