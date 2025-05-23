t = [4 8 12 16 20 24];
c = [1590 1320 1000 900 650 560];

% c(t) = be^-kt
% ln(c) = ln(b*e^-kt) = ln(b) + ln(e^-kt) = ln(b) + -kt * ln(e) = ln(b) -kt
% ln(c) = -kt + ln(b) -> y = -kx + b
yy = log(c);

coef = polyfit(t,yy,1);
A = coef(1);
B = coef(2);

k = -A;
b = exp(B);

c0 = b * exp(-k*0);
disp("final tormenta");
disp(c0);


