% Datos
x_cm = [0 200 400 600 800 1000 1200];
x = x_cm / 100;  % convertir a metros
rho = [4 3.95 3.89 3.80 3.60 3.41 3.30];         % g/cm^3
Ac = [100 103 106 110 120 133 149.6];            % cm^2

% Densidad lineal (g/cm) = rho * Ac
dens_lineal = rho .* Ac;  % en g/cm

% Convertir densidad a kg/m (100 g/cm = 1 kg/m)
dens_kg_m = dens_lineal * 0.01;

% a) Calcular masa usando regla del trapecio compuesta
m_trap = trapcomp(x, dens_kg_m);

% b) Calcular masa usando regla de Simpson compuesta
m_simp = simpsoncomp(x, dens_kg_m);

% Mostrar resultados
fprintf('Masa total (Trapecio): %.6f kg\n', m_trap);
fprintf('Masa total (Simpson): %.6f kg\n', m_simp);

% Diferencia relativa
rel_diff = abs(m_trap - m_simp) / m_simp;
fprintf('Diferencia relativa: %.2e\n', rel_diff);

