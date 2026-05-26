
f_total = 10.0:2.5:107.5;

V_total = [0.842, 0.911, 0.986, 1.062, 1.143, 1.227, 1.314, 1.401, 1.482, 1.551, 1.216, 1.048, 0.866, 0.689, 0.521, 0.364, 0.223, 0.103, 0.012, -0.041, -0.057, -0.034, 0.018, 0.096, 0.197, 0.318, 0.452, 0.579, 0.700, 0.809, 0.611, 0.688, 0.756, 0.811, 0.856, 0.894, 0.926, 0.954, 0.980, 1.004];

Z_total = [182.4, 178.9, 175.1, 171.0, 166.8, 162.7, 158.9, 155.4, 152.0, 149.0, 146.1, 145.2, 145.8, 147.3, 149.9, 153.5, 158.0, 163.2, 168.9, 174.8, 180.5, 186.2, 191.5, 196.2, 200.1, 203.1, 205.2, 206.3, 206.1, 204.7, 198.0, 194.4, 190.9, 187.8, 185.1, 183.0, 181.6, 180.8, 180.6, 180.9];

%CONSTRUIMOS EL SPLINE CUBICO ORIGINAL PARA EXTRAER EN UNA MATRIZ SUS COEFICIENTES%
pp_v = spline(f_total, V_total);
M_fun = @(x) ppval (pp_v,x); %asi armamos nuestra funcion M(x) splin cubicp%

% Refinamos usando la función exacta fzero de MATLAB
raiz_1_exacta = fzero(M_fun, 56.0); %Le damos un punto inicial cercano
raiz_2_exacta = fzero(M_fun, 63.0);
raiz_2 = 54.2665;
raiz_1 = 55.4351;
disp('=========================================================');
disp('   COMPARACIÓN: BISECCIÓN vs REFINAMIENTO DEL SPLINE');
disp('=========================================================');
fprintf('--- PRIMERA RAÍZ ---\n');
fprintf('Aproximación por Bisección (17 iter): %.6f kHz\n', raiz_1); % Variable raiz_1 del script anterrio
fprintf('Raíz exacta por Spline (fzero):       %.6f kHz\n', raiz_1_exacta);
fprintf('Error absoluto: %.6e kHz\n\n', abs(raiz_1 - raiz_1_exacta));

fprintf('--- SEGUNDA RAÍZ ---\n');
fprintf('Aproximación por Bisección (17 iter): %.6f kHz\n', raiz_2); % Variable raiz_2 del script anterior
fprintf('Raíz exacta por Spline (fzero):       %.6f kHz\n', raiz_2_exacta);
fprintf('Error absoluto: %.6e kHz\n', abs(raiz_2 - raiz_2_exacta));
disp('=========================================================');
