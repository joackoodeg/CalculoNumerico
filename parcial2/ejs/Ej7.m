x = [1 1.2 1.4 1.6 1.8 2.0 2.2 2.4];
y = [0.678 0.512 0.387 0.293 0.221 0.167 0.126 0.096];

% y = ae(^bx)
% ln(y) = ln(ae(^bx))
%       = ln(a) + ln(e(^bx))
%       = ln(a) + bx * ln(e)
%       = ln(a) + bx

% b = b -> b = coef(1)
% a = exp(a) -> a = exp(coef(2))

yy = log(y);
coef = polyfit(x,yy,1);

b= coef(1);
a=exp(coef(2));

y_real = @(x) a * exp(b * x);
x_sol = y_real(1.9);
disp(x_sol);

%%% b
dpf = @(x) a*b*exp(b*x)

F = @(x) 2 * pi * y_real(x) .* sqrt(1 + dpf(x).^2);

L=50; n= 5;
area = cuad_gauss_c(F,x(1),x(end),L,n);
disp(area);

