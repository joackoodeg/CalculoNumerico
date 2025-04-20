
tol = 1e-5;

n = 1000;
i = (1:n)';
%Crea un vector columna con los vaores del 1 al 1000
% i = [
%      1;
%      2;
%      3;
%      ...
%      1000];

main_diag = 2*i;
% Crea la diagonal principal de la matriz A, donde cada valor aii​=2i.
% main_diag = [2; 4; 6; ...; 2000]

diag2 = 0.5*i(1:end-2);
% Crea los valores para la diagonal secundaria a distancia ±2.
% i(1:end-2) toma los valores del 1 al 998.

diag4 = 0.25*(1:end-4);
% Igual que la anterior, pero para las diagonales a distancia ±4.
% Solo hasta el índice 996 porque vas a correrla 4 posiciones hacia adelante o atrás.

A = diag(main_diag) + ...
    diag(diag2, 2) + diag(diag2, -2) + ...
    diag(diag4,4) + diag(diag4, -4);

%    Esto arma la matriz A sumando las diagonales correspondientes:

%    diag(main_diag) → diagonal principal

%    diag(diag2, 2) → pone diag2 en la diagonal 2 por encima

%    diag(diag2, -2) → pone diag2 en la diagonal 2 por debajo

%    diag(diag4, 4) → 4 por encima

%    diag(diag4, -4) → 4 por debajo


b = pi * ones(n,1); %crea un vector b con todos los valores iguales a pi



