f = [100, 120, 145, 170, 200, 235, 270, 310, 355, 405, 460, 520, 585, 655, 730, 810, 895, 985, 1080, 1180, 1290, 1410, 1540, 1680, 1830, 1990, 2160, 2340, 2530, 2730];

Z = [152.3, 149.1, 146.8, 144.9, 142.0, 139.5, 137.9, 136.1, 134.8, 133.6, 132.7, 131.9, 131.4, 131.1, 130.9, 131.0, 131.3, 131.9, 132.7, 133.8, 135.2, 136.9, 138.9, 141.1, 143.5, 146.1, 149.0, 152.2, 155.6, 159.2];


Z_th = 150; % Umbral crítico
pp_Z = spline(f, Z);

% Definimos la función a evaluar: F(f) = |Z|(f) - 150 = 0
F_fun = @(x) ppval(pp_Z, x) - Z_th;

% Búsqueda exacta de raíces usando fzero (con 4 decimales mínimos de precisión)
% Sabemos por la tabla que hay un cruce cerca de 110 Hz y otro cerca de 2200 Hz
raiz_1 = fzero(F_fun, 110);
raiz_2 = fzero(F_fun, 2200);

disp('---------------------------------------------------------');
disp('   INCISO 1: FRECUENCIAS LÍMITE DE OPERACIÓN (Z = 150 Ohms)');
disp('---------------------------------------------------------');
fprintf('Raíz 1 (Corte Inferior): %.4f Hz\n', raiz_1);
fprintf('Raíz 2 (Corte Superior): %.4f Hz\n', raiz_2);
disp('---------------------------------------------------------');
disp('Banda de operación segura (|Z| < 150):');
fprintf('Desde %.4f Hz hasta %.4f Hz\n', raiz_1, raiz_2);
disp('---------------------------------------------------------');
