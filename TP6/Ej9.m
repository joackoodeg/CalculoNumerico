clc;
format long;

f  = @(x) x .^ 2 .* exp(-x);

% L = 1 -> Garantiza exactamente n = 2 o n = 3 puntos de integración.

Q=cuad_gauss_c(f,0,1,1,2);
Q_nc=intNCcompuesta(f,0,1,1,2);
Q_ex=integral(f,0,1);
disp("ggauss");
disp(Q);

disp("ggauss nc");
disp(Q_nc);

disp("exac");
disp(Q_ex);

Q_3=cuad_gauss_c(f,0,1,1,3);
Q_nc_3=intNCcompuesta(f,0,1,1,3);
disp("ggauss");
disp(Q_3);

disp("ggauss nc");
disp(Q_nc_3);

disp("exac");
disp(Q_ex);


