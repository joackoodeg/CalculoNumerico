clear all;clc;clf;

#planteo del modelo
#t^2*y'' - 2ty' + 2y = t^3 ln(t)
# y = y1
# y'= y2 = y1'
# y'' = y2' = 2/t*y2 - 2/t^2 * y1 + t*log(t)

f = @(t,y) [y(2,1);
            (2/t)*y(2,1) - (2/t^2)*y(1,1) + t*log(t)];

#Intervalo
a = 1;
b = 2;
h=0.05;
t = a:h:b;
inter=[a b];
L = length(t)-1;
#condiciones iniciales
y0 = [1;0];

#calculo con RungeKutta 4
%[t,yRK] = RungeKutta4(f,[a b],y0,length(t)-1);

[~,yRK]=rk4JJ(f, inter, y0, L);

# Calculo Predictor-Corrector
#Calculo con Adam Bashford Moulton
yPC = AdamsBashfortMoulton(f,t,y0); % predictor - Corrector

#valor exacto
yex = @(t) (7/4).*t + (1/2).*(t.^3).*log(t) - (3/4).*t.^3;

figure(1)
plot(t,yPC(1,:),'r-o') % solucion con Adam Bashford Moulton
hold on
plot(t,yRK(:,1),'b-o')  % solucion con Runge-Kutta 4
plot(t,yex(t),'g-*-')   % solucion exacta

title('Ejercicio 11')
xlabel('Tiempo')
ylabel('Y')
legend('solucion PC','solucion RK','solucion exacta')
grid on
grid minor
hold off

ErrorPC = abs(yPC(1,:) - yex(t));
ErrorRK = abs(yRK(:,1)' - yex(t));
figure(2)
semilogy(t,ErrorPC,'b-*')
hold on;
semilogy(t,ErrorRK,'r-o')
title('Error con PC y RK4')
xlabel('Tiempo')
ylabel('y')
legend('Error PC','Error RK')
grid on
hold off
grid minor

E_PC_max=max(ErrorPC)
E_RK_max=max(ErrorRK)
