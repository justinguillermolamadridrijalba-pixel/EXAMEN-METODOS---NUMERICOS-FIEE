f = [100, 120, 145, 170, 200, 235, 270, 310, 355, 405, 460, 520, 585, 655, 730, 810, 895, 985, 1080, 1180, 1290, 1410, 1540, 1680, 1830, 1990, 2160, 2340, 2530, 2730];

Z = [152.3, 149.1, 146.8, 144.9, 142.0, 139.5, 137.9, 136.1, 134.8, 133.6, 132.7, 131.9, 131.4, 131.1, 130.9, 131.0, 131.3, 131.9, 132.7, 133.8, 135.2, 136.9, 138.9, 141.1, 143.5, 146.1, 149.0, 152.2, 155.6, 159.2];

f_eval = 1000;

% Evaluación exacta mediante el Spline Cúbico
Z_spline_1000 = spline(f, Z, f_eval);

% Evaluación exacta mediante el Polinomio de Grado 10
[p10, S10, mu10] = polyfit(f, Z, 10);
Z_poli_1000 = polyval(p10, f_eval, S10, mu10);

% Impresión limpia de resultados para la tabla del informe
disp('---------------------------------------------------------');
disp('   VALORES OBTENIDOS INTERPOLADOS EN f = 1000 Hz');
disp('---------------------------------------------------------');
fprintf('Resultado con Spline Cúbico:         %.4f Ohmios\n', Z_spline_1000);
fprintf('Resultado con Polinomio Seleccionado: %.4f Ohmios\n', Z_poli_1000);
fprintf('Diferencia absoluta real calculada:  %.4f Ohmios\n', abs(Z_spline_1000 - Z_poli_1000));
disp('---------------------------------------------------------');
