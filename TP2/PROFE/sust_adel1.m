function x = sust_adel1(A)
% proceso de sustitucion hacia adelante (sustitucion)
% para calcular la solucion en eliminacion gaussiana
% para el calculo de la variable ultima x(n)
% como no tenemos que es x porque esta es una funcion distinta a gauss1 que
% la usa pero se podria usar en otros codigos

x = A(:,end); % necesario para x sea columna
n = length(x); % defino n pero como una variable local de este script

x(1) = A(1,n+1)/A(1,1);

for i=2:n % aca vamos hacia adelante
    s = A(i,n+1); % representa al termino de b en la fila i
    for j= 1:i-1 %lo hacemos para la sumatoria de los terminos a restar
        s = s - A(i,j)*x(j);
    end % for j
    
    x(i) = s/A(i,i);
    
end % for i