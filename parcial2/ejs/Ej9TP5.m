x = [-1; 0; 1; 2];
y = [-1.1; -0.4; -0.9; -2.7];

% -y = exp(a*x^2 + bx + c);
% ln(-y) = ln(-exp(a*x^2 + bx + c))
% ln(-y) = ln(exp)* (a*x^2 + bx + c)
% ln(-y) =  1 * (a*x^2 + bx + c)
% ln(-y) =  (a*x^2 + bx + c)

Y = log(-y);

p = polyfit(x,Y,2);

a = p(1);
b = p(2);
c = p(3);

t = linspace(-1.5,2.5,200);
y_orig = -exp(a.*t.^2 + b.*t +c);

plot(x,y,'ko'); hold on;
plot(t, y_orig, 'b');
