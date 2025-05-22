t = [4 8 12 16 20 24];
c = [1590 1320 1000 900 650 560];

%ln(c(t)) = ln(b) + ln(e^-kt)
%ln(c(t)) = ln(b) + -kt * ln(e)
%ln(c(t)) = ln(b) + -kt * 1
%ln(c(t)) = ln(b) -kt
%ln(c) = A + B*t
% tomando a :
    %Y = c(t),
    %X = be,
    %A = ln(b)
    %B = -k

% transformacion:
ln_c = log(c);
coef = polyfit(t,ln_c,1);
A = coef(2);
B = coef(1);

% volver
k = -B;
b = exp(A);

% a)
disp("valores de b y k");
disp(b); disp(k);

% b) -> Final tomrmenta t=0;
% si t = 0 ->
c0 = b * exp(-k*0);
disp("final tormenta");
disp(c0);

%% c)
% 200 = b * exp(-k*t);
% ln(200/b) / -k = t;

t_200 = (log(200) -log(b))/-k;
disp("t en c=200");
disp(t_200);
