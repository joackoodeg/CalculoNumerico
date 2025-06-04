%Ej12TP6.m
clear all; clc;clf;

% Acomodamos la función para el calculo

 f=@(u,v) (pi/2)*(10*(0.5*(u+1))+((0.5*(u+1)).^4).*cos(3*pi*v) + 2*((0.5*(u+1)).^3).*sin(2*pi*v));

 %f=@(u,v) (pi/2)*((0.5*(u+1)).^2).*((pi*v).^2)
 a=-pi;b=pi; % variación Angulo
 c=0;d=1; % Variacion Radio
 n=2;
 m=2;
 L1=1;
 L2=1;

 % Calculo de la Energia Total sobre la placa, consideramos rho*c=1

 % Función integración multiple
 J1=cuad_gauss_doble(f,a,b,c,d,m,n)

 J2 = intNCcompuesta2(f,a,b,c,d,L1,L2,n)

 % Funciones de Octave
 % integramos sobre un rectangulo de 2x2
 Q=quad2d(f,a,b,c,d)

 Q1=dblquad(f,a,b,c,d)
