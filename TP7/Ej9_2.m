format long;

f = @(t,y)([y(2);y(3);-4*sin(t)-2*cos(t)-4*y(3)-5*y(2)-2*y(1)]);

y0 = [1; 0; -1];

% Evaluar en t = 2.5 -> usar intervalo [0 2.5]

inter = [0 2.5];

L = 20; % Primer valor

[t, y_aux] = rk4(f,inter,y0,L);
y_aux = y_aux(end,1);

while(1)
  L = L*2; % Mejorar presicion
  [t, y_actual_sol] = rk4(f,inter,y0,L);
  y_actual= y_actual_sol(end,1); % porque el resultado es el ultimo valor del intervalo
  if(abs(y_aux-y_actual)<1e-6)
    break;
  endif
  y_aux = y_actual;
endwhile

disp("solucion con presicion");
disp(y_actual);

%% cuantas veces se aula y'
y_prima = y_actual_sol(:,2);
