clc;

t = [4 8 12 16 20 24];
c = [1590 1320 1000 900 650 560];

% c(t) = be^-kt
% ln(c(t)) = ln(be^-kt)
%          = ln(b) + ln(e^-kt)
%          = ln(b) + -kt*ln(e^)
%          = ln(b) + -kt

C = log(c);
coef = polyfit(t,C,1);

% -k = coef(1)
% b = exp(coef(2));
k = -coef(1);
b = exp(coef(2));

disp("valores de b y k");
disp(b); disp(k);

tt = linspace(4, 24, 100);
c_orig = b.*exp(-k.*tt);

plot (t, c, 'ko'); hold on;
plot(tt, c_orig, 'b');

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
