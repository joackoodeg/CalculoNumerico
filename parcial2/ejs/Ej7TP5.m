t1 = [0, 1, 2];
x1 = [0, 2, 6];
y1 = [0, 4, 6];

t2= [2, 3, 4];
x2= [6, 3, 0];
y2= [6, 2, 0];

[xt1,~,~]=funcion_spline(t1,x1);
[xt2,~,~]=funcion_spline(t2,x2);
tt1 = linspace(0, 2, 100);
tt2 = linspace(2,4,100);

figure(1);
title("X VS T");
plot(tt1, xt1(tt1)); hold on;
plot(tt2, xt2(tt2));

[yt1,~,~]=funcion_spline(t1,y1);
[yt2,~,~]=funcion_spline(t2,y2);

figure(2);
title("Y VS T");
plot(tt1, yt1(tt1)); hold on;
plot(tt2, yt2(tt2));

figure(3);
title("X VS Y");
plot(xt1(tt1), yt1(tt1)); hold on;
plot(xt2(tt2), yt2(tt2));
