f=@(t,x) ([-t * x(2); t*x(1)-t*x(2)]);

Ti=0;
Tf=20;
x0=[1;-1]; %  punto de partida

h=0.05; % paso de tiempo
n = (Tf-Ti)/h; % cantidad de pasos

[t,x] = euler(f, [Ti Tf], x0, n);

figure();
axis([-0.2 0.2 -0.2 0.2]);
plot(x(:,1), x(:,2));
grid on;
grid minor;

%% Posible ej
% A partir de que momento la distancia de la particula
% es menor a 0,01 al atractor (0,0)

% Momento: Es el valor de t en el que la partícula entra dentro del radio de 0.01 respecto del punto (0,0).
%Es decir: El instante en que se acerca al atractor lo suficiente.

% rows = devuelve la cantidad de filas
x1 = x(:,1);
x2 = x(:,2);

momento=-1;
for i = 1 : rows(x1)
  dist=sqrt(x1(i)^2 + x2(i)^2);

  if(dist<0.01)
    momento=t(i);
    break;
  endif
endfor
hold on;

% graficamos el punto
plot(x1(i),x2(i), 'ro');

disp("momento"); disp(momento);

