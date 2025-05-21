% Ejercicio 11 - Trabajo Práctico 5
% Cálculo Numérico 2025

% Defino el vector de tiempo (en horas)
% Dado que se registró cada 12 minutos durante 5 horas
t = 0:0.2:5;  % 26 puntos de 0 a 5 horas, cada 0.2 horas

% Datos de velocidad del archivo
v = [0.61255; 1.40101; 2.69013; 3.40985; 3.95361; 3.59041;
     3.09119; 2.71147; 2.01397; 1.35229; 1.09930; 1.30715;
     1.99290; 3.46081; 5.34487; 7.50176; 9.35324; 11.22945;
     12.76212; 13.99448; 14.41532; 14.47064; 13.91045; 13.01681;
     12.18537; 11.26826];

% a) Ajuste para v(t) = c₁ sin(2t) + c₂t² + c₃/t + c₄
% Manejo especial para t=0 debido a la singularidad en c₃/t
t_nozero = t(2:end);  % Excluyendo t=0
v_nozero = v(2:end);  % Valores correspondientes

A_nozero = zeros(length(t_nozero), 4);
A_nozero(:,1) = sin(2*t_nozero);      % c₁ sin(2t)
A_nozero(:,2) = t_nozero.^2;          % c₂t²
A_nozero(:,3) = 1./t_nozero;          % c₃/t
A_nozero(:,4) = ones(size(t_nozero)); % c₄

% Resolviendo por mínimos cuadrados
c = A_nozero \ v_nozero;

fprintf('a) Función de la forma v(t) = c₁sin(2t) + c₂t² + c₃/t + c₄\n');
fprintf('   c₁ = %.4f\n', c(1));
fprintf('   c₂ = %.4f\n', c(2));
fprintf('   c₃ = %.4f\n', c(3));
fprintf('   c₄ = %.4f\n', c(4));

% Predicción para t = 6 horas
t_predict = 6;
v_predict_a = c(1)*sin(2*t_predict) + c(2)*t_predict^2 + c(3)/t_predict + c(4);
fprintf('   Velocidad predicha a las 6 horas: %.4f km/h\n', v_predict_a);

% b) Polinomio de grado ≤ 6
p = polyfit(t, v, 6);

fprintf('\nb) Polinomio de grado ≤ 6\n');
fprintf('   Coeficientes (de mayor a menor grado):\n   ');
fprintf('%.4e ', p);
fprintf('\n');

% Predicción para t = 6 horas con el polinomio
v_predict_b = polyval(p, 6);
fprintf('   Velocidad predicha a las 6 horas: %.4f km/h\n', v_predict_b);

% c) Cálculo del error cuadrático para ambos ajustes
% Para el modelo (a), manejo especial para t=0
v_model_a = zeros(size(t));
v_model_a(1) = c(4);  % Solo el término constante en t=0
for i = 2:length(t)
    v_model_a(i) = c(1)*sin(2*t(i)) + c(2)*t(i)^2 + c(3)/t(i) + c(4);
end
error_a = sum((v - v_model_a).^2);

% Para el modelo polinómico
v_model_b = polyval(p, t);
error_b = sum((v - v_model_b).^2);

fprintf('\nc) Análisis de errores cuadráticos\n');
fprintf('   Error cuadrático del modelo a: %.4f\n', error_a);
fprintf('   Error cuadrático del modelo b: %.4f\n', error_b);

if error_a < error_b
    fprintf('   El modelo a tiene menor error y es más apropiado.\n');
    mejor_modelo = 'a';
else
    fprintf('   El modelo b (polinomio) tiene menor error y es más apropiado.\n');
    mejor_modelo = 'b';
end

% d) Cálculo de la distancia recorrida usando el modelo apropiado
% Integración numérica, evitando singularidad en t=0 para modelo a
t_denso = linspace(0.001, 6, 1000);  % Evitando t=0 exactamente
v_denso_a = c(1)*sin(2*t_denso) + c(2)*t_denso.^2 + c(3)./t_denso + c(4);
distancia_a = trapz(t_denso, v_denso_a);

v_denso_b = polyval(p, t_denso);
distancia_b = trapz(t_denso, v_denso_b);

fprintf('\nd) Cálculo de la distancia recorrida en las primeras 6 horas\n');
if strcmp(mejor_modelo, 'a')
    fprintf('   Usando el modelo a, distancia recorrida: %.4f km\n', distancia_a);
else
    fprintf('   Usando el modelo b, distancia recorrida: %.4f km\n', distancia_b);
end
