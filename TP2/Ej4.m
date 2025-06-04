% Definir la matriz y el vector de términos independientes para sustitución hacia atrás
A_atras = [1 -1 2 -1; 0 2 -1 1; 0 0 -1 -1; 0 0 0 2];
b = [-8; 6; -4; 4];

% Crear la matriz transpuesta para el sistema de sustitución hacia adelante
A_adelante = A_atras';

% Probar la función de sustitución hacia atrás
x_atras = sust_atras(A_atras, b);
disp('Solución del sistema triangular superior (sustitución hacia atrás):');
disp(x_atras);

% Probar la función de sustitución hacia adelante
x_adelante = sust_adelante(A_adelante, b);
disp('Solución del sistema triangular inferior (sustitución hacia adelante):');
disp(x_adelante);

% Verificar si las soluciones son correctas
disp('Verificación del sistema triangular superior:');
disp(A_atras * x_atras - b);

disp('Verificación del sistema triangular inferior:');
disp(A_adelante * x_adelante - b);
