f = @(x) x .^ 2 .* exp(-x);

%% n = 2 L = 1
Q_gauss = cuad_gauss_c(f,0,1,1,2);
Q_NC = intNCcompuesta(f,0,1,1,2);
Q_I = integral(f,0,1);

disp("gauss "); disp(Q_gauss);
disp("NC"); disp(Q_NC);
disp("octave"); disp(Q_I);

%% n = 3 L = 1
Q_gauss_3 = cuad_gauss_c(f,0,1,1,3);
Q_NC_3 = intNCcompuesta(f,0,1,1,3);
Q_I_3 = integral(f,0,1);

disp("gauss "); disp(Q_gauss_3);
disp("NC"); disp(Q_NC_3);
disp("octave"); disp(Q_I_3);
