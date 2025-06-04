% Ejercicio 5 - TP2
% Solución simplificada que usa la función sust_atras externa

% Definimos los coeficientes de sensibilidad (matriz S)
S = [16.87, 0.1650, 0.2019, 0.3170, 0.2340, 0.1820, 0.1100;
     0.0, 27.70, 0.8620, 0.0620, 0.0730, 0.1310, 0.1200;
     0.0, 0.0, 22.35, 13.05, 4.420, 6.001, 3.043;
     0.0, 0.0, 0.0, 11.28, 0.0, 1.110, 0.3710;
     0.0, 0.0, 0.0, 0.0, 9.850, 1.1684, 2.108;
     0.0, 0.0, 0.0, 0.0, 0.2990, 15.98, 2.107;
     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.670];

% Definimos las alturas de los picos (vector h)
h = [17.1; 65.1; 186.0; 82.7; 84.2; 63.7; 119.7];

% Aplicamos la función de sustitución hacia atrás (ya definida externamente)
p = sust_atras(S, h);

% Mostramos los resultados de forma sencilla
disp('Presiones parciales (μm de Hg):')
disp(p)

% Calculamos y mostramos la presión total
presion_total = sum(p);
disp(['Presión total calculada: ', num2str(presion_total), ' μm de Hg'])
disp(['Presión total medida: 3878 μm de Hg'])
disp(['Error relativo: ', num2str(100*abs(presion_total-3878)/3878), '%'])

% Verificamos el residuo
residuo = norm(S*p - h);
disp(['Residuo: ', num2str(residuo)])
