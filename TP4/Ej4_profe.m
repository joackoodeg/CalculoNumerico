# TP4 Ejercicio 4 Ej4TP4.m
clear all;
clc; clf
f  = @(x) sin(x) + cos(1+x.^2) - 1;
df = @(x) cos(x) - 2*x*sin(1+x.^2);
% Intervalo para ver las raices menores a 5 positivas

a=1.5;
b=2.2;

x=linspace(a,b,200);
ff=f(x);
z=@(x) 0.*x;
zz=z(x);
figure(1)
plot(x,ff,'-+b',x,zz,'-k','linewidth',3);
grid minor

% datos
kmax=100;
maxit=100;
tol=1.0e-10;
% primero aproximo con biseccion
disp('Metodo de bisección')
[pb, rh, itb, t] = biseccion(f, a, b, maxit, tol);
disp('datos del calculo por biseccion:')
pb
itb
x01=pb;

x0=a;
x1=b;


disp('Metodo de Newton')
[xNew1,rhNew1,itNew1,tNew1] = Newton(f,df,x01,kmax,tol);
xNew1
itNew1

% metodo de la secante
disp('Metodo de la secante')
[xs, rhs, its, ts] = secante(f, x0, x1, kmax, tol)
xs
its

xr=linspace(1,7,200);
fr=f(xr);
z=@(x) 0.*x;
zz=z(xr);
figure(2)
plot(xr,fr,'-+b',xr,zz,'-k','linewidth',3);
grid minor
