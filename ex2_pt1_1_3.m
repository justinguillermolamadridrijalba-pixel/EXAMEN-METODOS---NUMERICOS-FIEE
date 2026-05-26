
disp('=============================================')
disp('FORMACION DEL SPLINE CUBICO UTILIZANDO LOS 40 DATOS')
disp('=============================================')

f_total = 10.0:2.5:107.5;

V_total = [0.842, 0.911, 0.986, 1.062, 1.143, 1.227, 1.314, 1.401, 1.482, 1.551, 1.216, 1.048, 0.866, 0.689, 0.521, 0.364, 0.223, 0.103, 0.012, -0.041, -0.057, -0.034, 0.018, 0.096, 0.197, 0.318, 0.452, 0.579, 0.700, 0.809, 0.611, 0.688, 0.756, 0.811, 0.856, 0.894, 0.926, 0.954, 0.980, 1.004];

Z_total = [182.4, 178.9, 175.1, 171.0, 166.8, 162.7, 158.9, 155.4, 152.0, 149.0, 146.1, 145.2, 145.8, 147.3, 149.9, 153.5, 158.0, 163.2, 168.9, 174.8, 180.5, 186.2, 191.5, 196.2, 200.1, 203.1, 205.2, 206.3, 206.1, 204.7, 198.0, 194.4, 190.9, 187.8, 185.1, 183.0, 181.6, 180.8, 180.6, 180.9];

%FRECUENCIAS A EVALUAR%
f_evaluar = [41.0, 73.0];

%EVALUAMOS EL SPLINE CUBCIO EN LOS DOS PUNTOS QUE NOS PIDEN%

V_spline_valor = spline(f_total, V_total, f_evaluar);
Z_spline_valor = spline(f_total, Z_total, f_evaluar);

%IMPRIMIMOS LOS RESULTADOS EN CONSOLA%
disp('--- 1. Resultados para f = 41.0 kHz ---');
fprintf('Estimación V(41.0) = %.4f V\n', V_spline_valor(1));
fprintf('Estimación |Z|(41.0) = %.4f Ohmios\n\n', Z_spline_valor(1));

disp('--- 2. Resultados para f = 73.0 kHz ---');
fprintf('Estimación V(73.0) = %.4f V\n', V_spline_valor(2));
fprintf('Estimación |Z|(73.0) = %.4f Ohmios\n', Z_spline_valor(2));
disp('=========================================================');