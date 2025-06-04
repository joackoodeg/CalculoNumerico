f = @(t, x)  ([-t*x(2); t*x(1) - t*x(2)]);
Ti = 0;
Tf = 20;
h = 0.05;
inter = [Ti Tf];
L = (20-0)/h;

[t,x] = euler(f,inter,[1 -1],L);

x1 = x(:,1);
x2 = x(:,2);

figure();
plot(x1,x2);
grid on;

%% Posible ej
% A partir de que momento la distancia de la particula
% es menor a 0,01 al atractor (0,0)

momento = -1;
for i=1: rows(x1)
  dist = sqrt(x1(i)^2 + x2(i)^2);
  if(dist < 0.01)
    momento = t(i);
    break;
  endif
endfor

hold on;
plot(x1(i),x2(i),'ro');




