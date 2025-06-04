f = @(x) 20 .* x - (x.^3)/5;
df = @(x) 20 - (3*x.^2)/5;
g = @(x) 2 * pi .* f(x) .* sqrt(1 + (df(x)).^2);

Q_gauss= cuad_gauss_c(g,0,2,1,3);
Q_simp1 =intNCcompuesta(g,0,2,1,3);

L2 = 5;
x2 = linspace(0,2,L2 +1);
y2= g(x2);

% Este da mal porqu simpson requiere una cantidad impar de puntos,
% es decir, una cantidad par de intervalos
% funcionaria mejor con L=4 y L=6
Q_simp2 = simpsoncomp(x2,y2);

Q_trap = trapcomp(x2, y2);

disp("Gauss: ");
disp(Q_gauss);

disp("Simpson L=1 n=3");
disp(Q_simp1);

disp("Simpson L=5 n=3");
disp(Q_simp2);

disp("Trap L=5 n=3");
disp(Q_trap);

disp("Quad octave");
Q_oct = quad(g,0,2);
disp(Q_oct);
