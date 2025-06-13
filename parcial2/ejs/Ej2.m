f = @(x) [0 .* x, 0 .* x, -20 .* exp(-10 .* (x - 0.7) .^ 2)];

inter = [0 1];
yc = [5 6];

L = 40;

[x,y]=dif_fin_dir(f,inter,yc,L);

plot(x, y, 'b');
xlabel("x"); ylabel("u(x)");
grid on;

%%% METODO MANUAL

%% Para encontrar en que indice esta x = 0.5

%% L = 1-0 / h
%% 40 = 1-0 /h -> 1/40 = h

%% buscar un numero w tal que w*1/40 = 0.5 -> 0.5 / (1/40) = 20
%% El nodo 20 se accede desde y(21) ya que el primer indice es 1

%% Solucion:
disp(y(21));

%%% METODO AUTOMATICO
% Buscar u(0.5)
indice = find(abs(x - 0.5) < 1e-6);  % Debería ser el índice 21
disp(indice);
u_05 = y(indice);

% Mostrar resultado
fprintf('u(0.5) ≈ %.6f\n', u_05);
