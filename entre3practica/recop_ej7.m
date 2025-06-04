x = [1 1.2 1.4 1.6 1.8 2.0 2.2 2.4];
y = [0.678 0.512 0.387 0.293 0.221 0.167 0.126 0.096];

% y = ae(^bx)
% ln(y) = ln(ae(^bx)) = ln(a) + ln(e(^bx)) = ln(a) + bx * ln(e)
% ln(y) = ln(a) + bx

% b = coef(1)
% a = exp(coef(2));
yy = log(y);
coef = polyfit(x,yy,1);
%disp(polyout(coef, 'x'));

b = coef(1);
a = exp(coef(2));

y_nueva = @(x) a .* exp(b .* x);
% rta a)

x_a = y_nueva(1.9);
printf("a) %.5f", x_a);

% b)

