%%
#F=mg-cv ==> ma=mg-cv ==> mr''=mg-cr'
%% obtener tiempo y pos de caida

#llamemos x(1) pos x y x(2)  pos y
#y x(3),x(4) las comp de la velocidad en x y en y respectivamente

g=9.81;
c=0.2;
m=10;
f=@(t,x) [x(3); x(4); -(c/m)*x(3); -g-(c/m)*x(4)];
x0=[0,30,40,0];
[t, y] = rk4(f,[0 3], x0,100);
pos_y=y(:,2);
plot(t, pos_y);

%% ahora:
pf = polyfit(t,pos_y,10);
pv = @(t) polyval(pf,t);
[punto, h] = biseccion(pv, 2.4, 2.6, 100, 1e-4);
disp("tiempo");
disp(punto);

disp("pos");
[t2, y2] = rk4(f,[0 punto], x0,100);
pos = y2(end,1);
disp(pos);

%%% b
[tb, yb] = rk4(f,[0 2], x0,100);
y=sqrt(yb(:,3).^2 + yb(:,4).^2);
dist = simpsoncomp(tb,y);
disp("distancia");
disp(dist);
