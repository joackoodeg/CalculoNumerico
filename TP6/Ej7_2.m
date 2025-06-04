x = [0 200 400 600 800 1000 1200];
rho = [4 3.95 3.89 3.80 3.60 3.41 3.30];         % g/cm^3
Ac = [100 103 106 110 120 133 149.6];            % cm^2

y = rho .* Ac;

Qtrap = trapcomp(x,y);
Qsimp = simpsoncomp(x,y);

format long;
disp(Qtrap);
disp(Qsimp);
