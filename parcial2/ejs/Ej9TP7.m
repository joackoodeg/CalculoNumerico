format long;

% y4 = -4y3 -5y2 -2y(1) -4sint -2cost
f = @(t,y)[y(2);y(3);-4*sin(t)-2*cos(t)-4*y(3)-5*y(2)-2*y(1)];
inter = [0 2.5];
y0 = [1; 0; -1];
L = 10;

[t,y]=rk4(f, inter, y0, L);

y_actual = y(end,1);

while(1)
  L = L*2;
  [t_next,y_next]=rk4(f, inter, y0, L);

  y_next_val = y_next(end,1);

  if(abs(y_actual - y_next_val)<1e-6)
    break;
  endif

  y_actual=y_next_val;
endwhile

disp(y_actual);
plot(t,y(:,1),'b',2.5,y_actual,'ko');

%% b
[tb,yb]=rk4(f, [0 15], y0, L);
% Contar cambios de signo en la segunda derivada (y'')
inflexiones = 0;

for i = 1:length(yb)-1
  if yb(i,3)*yb(i+1,3) < 0
    inflexiones++;
  endif
endfor

fprintf("Cantidad de puntos de inflexión de y(t): %d\n", inflexiones);

plot(tb,yb(:,2));
