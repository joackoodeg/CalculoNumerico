%% -u'' + 5u -100x(1-x) = 0
%% p = 0, q = 5, r = -100x(1-x)
%% 41 puntos -> 40 subintervalos -> L = 40

f = @(x) [0 .* x, 5 .* ones(size(x)), -100 .* x .* (1-x)];

inter = [0 1];
yc = [0 0];
L = 40;

[x,y]=dif_fin_dir(f,inter,yc,L);

plot(x,y);

indice = find(abs(x - 0.5) < 1e-6);  % Debería ser el índice 21
disp(indice);
u_05 = y(indice);
fprintf('u(0.5) ≈ %.6f\n', u_05);
