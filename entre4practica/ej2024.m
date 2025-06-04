f = @(t,y)([y(2); -sin(y(1)) - y(2) + 20*cos(y(1))^2]);

y0 = [pi/2; 0];

L = 10;
[t,y]=rk4(f,[0 2], y0, L);
y_aux = y(end,1);

while(1)
  L = L*2;
  [t,y_act]=rk4(f,[0 2], y0, L);
  y_actual = y_act(end,1);
  if(abs(y_actual - y_aux)<1e-4)
    break;
  endif
y_aux = y_actual;
endwhile

disp(y_actual);

%% b
inter2 = [0 4];
[t_2,y_2]=rk4(f,inter2, y0, L);
plot(t,y_2(:,2));

%% c
inter3 = [0 100];
[t_3,y_3]=rk4(f,inter3, y0, 1000);
ang_final = y_3(end,1);
ang_radianes = ang_final * 180/pi;
disp(ang_radianes);


