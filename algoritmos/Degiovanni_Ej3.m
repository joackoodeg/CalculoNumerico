% Frecuencias
f1 = 440;
f2 = 660;
f3 = 1100;
f4 = 5;
f5 = 8;

% Tabla
t = [0, 0.0025, 0.005, 0.0075, 0.01];
s_t = [2.1004; 4.3702; 5.1745; -0.7222; 0.9249];

% Matriz
A = zeros(5, 5);

for i = 1:5
    A(i, 1) = sin(2*pi*f1*t(i));
    A(i, 2) = sin(2*pi*f2*t(i));
    A(i, 3) = sin(2*pi*f3*t(i));
    A(i, 4) = cos(2*pi*f4*t(i));
    A(i, 5) = sin(2*pi*f5*t(i));
end

%%% a

Aum = [A, s_t];

[Ap, r]= doolittle_p (Aum);

%% los permuto
Af = Ap(r,:);
bp = s_t(r);

L = tril(Af, -1) + eye(size(Af));
U = triu(Af);

y = sust_adelante(L, bp);
amplitudes = sust_atras(U, y);

disp('Amplitudes:');
printf('A1 = %.4f\n', amplitudes(1));
printf('A2 = %.4f\n', amplitudes(2));
printf('A3 = %.4f\n', amplitudes(3));
printf('A4 = %.4f\n', amplitudes(4));
printf('A5 = %.4f\n', amplitudes(5));

%%% b
ApSor = A(r, :);
x0 = zeros(5,1);
maxit = 1000;

%for w=0: 0.1: 2
%  [x_sor, rh_sor, it_sor] = sor(ApSor, bp, x0, maxit, 1e-4, w);
%  printf("it= %d\n", it_sor);
%  printf("w= %d\n", w);
%endfor

% Luego se observa que tiene 23 iteraciones para 0.5 y 0.6
% por lo que ahora se procede a buscar con 2 cifras decimales

for w=0.5: 0.01: 0.7
  [x_sor, rh_sor, it_sor] = sor(ApSor, bp, x0, maxit, 1e-4, w);
  printf("w= %d\n", w);
  printf("it= %d\n", it_sor);
endfor

%% Nota:
%% Si se opta por un criterio de Error relativo infinito los resultados son:
%% w optimo = 0.54, iteraciones = 21.
%% Denoto esto ya que al no decir la palabra "relativo" entiendo que tengo que usar este criterio



