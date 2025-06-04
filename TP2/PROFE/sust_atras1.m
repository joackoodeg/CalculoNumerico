function [x] = sust_atras1(A)
% proceso de sustitucion hacia atrás (retrosustitucion)
% para calcular la solucion en eliminacion gaussiana
% para el calculo de la variable ultima x(n)
% como no tenemos que es x porque esta es una funcion distinta a gauss1 que
% la usa pero se podria usar en otros codigos

n=length(A(:,1));
x=zeros(n,1);
%x = A(:,end) % necesario para x sea columna
%n = length(x); % defino n pero como una variable local de este script

x(n) = A(n,n+1)/A(n,n);

for i=n-1:-1:1 % ojo importante el -1 de paso porque sino no reconoce
               % que tiene que ir hacia atrás ej: n=50 i = 49:1, interpreta
               % que el paso es 1 entonces el siguiente numero es 50 y
               % deberia ser 48 y no sigue
    s = A(i,n+1); % representa al termino de b en la fila i
    for j= i+1:n %lo hacemos para la sumatoria de los terminos a restar
        s = s - A(i,j)*x(j);
    end % for j
    
    x(i) = s/A(i,i);
    
end % for i

