f = [100, 120, 145, 170, 200, 235, 270, 310, 355, 405, 460, 520, 585, 655, 730, 810, 895, 985, 1080, 1180, 1290, 1410, 1540, 1680, 1830, 1990, 2160, 2340, 2530, 2730];

Z = [152.3, 149.1, 146.8, 144.9, 142.0, 139.5, 137.9, 136.1, 134.8, 133.6, 132.7, 131.9, 131.4, 131.1, 130.9, 131.0, 131.3, 131.9, 132.7, 133.8, 135.2, 136.9, 138.9, 141.1, 143.5, 146.1, 149.0, 152.2, 155.6, 159.2];


pp_Z = spline(f, Z);
[nodos, coefs] = unmkpp(pp_Z);

% 3. DERIVACIÓN ANALÍTICA DE LA PRIMERA DERIVADA (S')
% Derivada de ax^3 + bx^2 + cx + d = 3ax^2 + 2bx + c
coefs_d1 = [3*coefs(:,1), 2*coefs(:,2), coefs(:,3)];
pp_d1 = mkpp(nodos, coefs_d1);

% 4. Evaluamos la primera derivada en los 30 puntos de datos (Como pide el examen)
dZ_df_puntos = ppval(pp_d1, f);

disp('---------------------------------------------------------');
disp('   TASA DE CAMBIO (1ra Derivada) EN LOS PUNTOS DE DATOS');
disp('---------------------------------------------------------');
fprintf('Mostrando los primeros 5 puntos como demostración:\n');
for i = 1:5
    fprintf('Frecuencia: %4d Hz -> d|Z|/df = %8.4f Ohms/Hz\n', f(i), dZ_df_puntos(i));
end

% 5. Búsqueda de la ubicación del mínimo (cruce por cero)
f_min_exacto = fzero(@(x) ppval(pp_d1, x), 730);

disp('---------------------------------------------------------');
fprintf('=> El mínimo exacto (cambio de negativa a positiva) ocurre en: %.4f Hz\n', f_min_exacto);
disp('---------------------------------------------------------');

% 6. GRÁFICA DE LA PRIMERA DERIVADA
f_fina = linspace(min(f), max(f), 500);
dZ_df_fina = ppval(pp_d1, f_fina);

figure;
hold on;
plot(f_fina, dZ_df_fina, 'b-', 'LineWidth', 2, 'DisplayName', 'Primera Derivada (Analítica)');
plot(f, dZ_df_puntos, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 5, 'DisplayName', 'Evaluación en ptos. medidos');
yline(0, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Eje Cero (Punto de inflexión)');
plot(f_min_exacto, 0, 'rs', 'MarkerFaceColor', 'r', 'MarkerSize', 8, 'DisplayName', 'Ubicación del mínimo');

title('Primera Derivada del Spline Cúbico (d|Z|/df)', 'FontSize', 12);
xlabel('Frecuencia (Hz)');
ylabel('Tasa de cambio d|Z|/df (\Omega / Hz)');
legend('Location', 'best');
grid on;
hold off;
