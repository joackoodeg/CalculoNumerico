% Usamos con funciones de contorno natural
% Ej7Tp052025natural.m
#brazoRobotico.m
clear all; clc; clf;

t1=[0 1 2];
t2=[2 3 4];
x1=[0 2 6];
x2=[6 3 0];
y1=[0 4 6];
y2=[6 2 0];

% curva t vs x (tiempo coordenada x)
% PRIMERA ETAPA (Tiempo vs Posicion X) IDA
%df1x0=0; df1xn=0;
[Sx1,dSx1,ddSx1]=funcion_spline(t1,x1);

figure(1)
% GRAFICAMOS LOS PUNTOS DADOS.
plot(t1,x1,'bo', 'MarkerEdgeColor','k',...
'MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10)
hold on % para graficar el Spline en la misma grafica.
tt1=linspace(0,2,101);
% Grafica de la función Spline Cúbica Natural
plot(tt1,Sx1(tt1),'k-','linewidth',2)
grid on; grid minor;
xlabel('Datos Tiempo')
ylabel('Posicion X')
title('Primera y Segunda Etapa brazo robotico-Tiempo vs Posicion X')

% SEGUNDA ETAPA (Tiempo vs Posicion X) REGRESO
%df2x0=0; df2xn=0;
[Sx2,dSx2,ddSx2]=funcion_spline(t2,x2);

plot(t2,x2,'bo', 'MarkerEdgeColor','k',...
'MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10)
tt2=linspace(2,4,101);
% Grafica de la función Spline Cúbica Natural
plot(tt2,Sx2(tt2),'r-','linewidth',2)
hold off;
%==================================================================
% curva t vs y (tiempo coordenada y)
% PRIMERA ETAPA (Tiempo vs Posicion y) IDA
%df1y0=0; df1yn=0;
[Sy1,dSy1,ddSy1]=funcion_spline(t1,y1);

figure(2)
% GRAFICAMOS LOS PUNTOS DADOS.
plot(t1,y1,'bo', 'MarkerEdgeColor','k',...
'MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10)
hold on % para graficar el Spline en la misma grafica.
tt1=linspace(0,2,101);
% Grafica de la función Spline Cúbica Natural
plot(tt1,Sy1(tt1),'k-','linewidth',2)
grid on; grid minor;
xlabel('Datos Tiempo')
ylabel('Posicion Y')
title('Primera y Segunda Etapa brazo robotico-Tiempo vs Posicion Y')

% SEGUNDA ETAPA (Tiempo vs Posicion X) REGRESO
%df2y0=0; df2yn=0;
[Sy2,dSy2,ddSy2]=funcion_spline(t2,y2);

plot(t2,y2,'bo', 'MarkerEdgeColor','k',...
'MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10)
tt2=linspace(2,4,101);
% Grafica de la función Spline Cúbica Natural
plot(tt2,Sy2(tt2),'r-','linewidth',2)
hold off;
%==================================================================

% Curva X vs Y  TRAYECTORIA DEL BRAZO EN EL PLANO XY
figure(3)
%Graficamos los puntos IDA
plot(x1,y1,'bo', 'MarkerEdgeColor','k',...
'MarkerFaceColor',[0.49 1 0.63],'MarkerSize',10)
hold on;
plot(x2,y2,'bo', 'MarkerEdgeColor','k',...
'MarkerFaceColor',[0.5 0.7 0.3],'MarkerSize',10)
plot(Sx1(tt1),Sy1(tt1),'k-','linewidth',2)
plot(Sx2(tt2),Sy2(tt2),'r-','linewidth',2)

grid on; grid minor;
xlabel('posicion X');
ylabel('posicion Y');
legend('Puntos Ida', 'Puntos Regreso','Trayectoria Ida', 'Trayectoria Regreso','location','south')
title('Trayectoria del brazo ida y regreso plano XY SPLINE NATURAL')
hold off;
