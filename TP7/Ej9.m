#{
  y(3) + 4y'' + 5y' +2y = -4sent(t) - 2 cos(t)
  y1 = y
  y2 =y1' = y'
  y3 = y2' = y''
  y3' = y''' = -4sen(t) - 2cos(t) - 4y3 - 5y2  - 2y1
#}
format long;

y0 = [1;0;-1];

F = @(t, u)[u(2); u(3); -4*sin(t)-2*cos(t)-4*u(3)-5*u(2)-2*u(1)];

inter=[0 2.5];
L = 20;

[t,y]=rk4(F,inter,y0,L);

y_aux= y(end, 1); %% Se toma el ultimo valor, porque 2.5 es extremo de intervalo

% si rk4 no convergue entonces es un loop infinito
while(1)
  L = L*2; % Duplicar cant de pasos para buscar mayor exactitud
 [t,y_dsp]=rk4(F,inter,y0,L);

  y_actual = y_dsp(end,1); % toamos valor actual
  if(abs(y_aux - y_actual)<1e-6) % nos fijamos si cumple la restriccion (6 digitos exactos)
    break;
  endif

  y_aux = y_actual; % CONTINUAMOS
endwhile

disp("valor en t-2.6 con 6 decimales exactos");
disp(y_actual);

%%% Graficar funciones y y' y''
[t, y2] = rk4(F,[0 15], y0, 600);
plot(t, y2(:,1), t, y2(:,2), t, y2(:,3));
grid on;
legend("y", "y'", "y''");

