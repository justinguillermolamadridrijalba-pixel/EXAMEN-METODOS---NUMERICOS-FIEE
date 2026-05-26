f = [100, 120, 145, 170, 200, 235, 270, 310, 355, 405, 460, 520, 585, 655, 730, 810, 895, 985, 1080, 1180, 1290, 1410, 1540, 1680, 1830, 1990, 2160, 2340, 2530, 2730];

Z = [152.3, 149.1, 146.8, 144.9, 142.0, 139.5, 137.9, 136.1, 134.8, 133.6, 132.7, 131.9, 131.4, 131.1, 130.9, 131.0, 131.3, 131.9, 132.7, 133.8, 135.2, 136.9, 138.9, 141.1, 143.5, 146.1, 149.0, 152.2, 155.6, 159.2];

pp_Z = spline(f, Z);
[nodos, coefs] = unmkpp(pp_Z);

% Recalculamos el cruce exacto de la 1ra derivada (del Inciso 1)
coefs_d1 = [3*coefs(:,1), 2*coefs(:,2), coefs(:,3)];
pp_d1 = mkpp(nodos, coefs_d1);
f_min_exacto = fzero(@(x) ppval(pp_d1, x), 730);

% DERIVACIÓN ANALÍTICA DE LA SEGUNDA DERIVADA (S'')
% Derivada de 3ax^2 + 2bx + c = 6ax + 2b
coefs_d2 = [6*coefs(:,1), 2*coefs(:,2)];
pp_d2 = mkpp(nodos, coefs_d2);

% Evaluación en el mínimo
d2Z_df2_min = ppval(pp_d2, f_min_exacto);

disp('---------------------------------------------------------');
disp('   ESTIMACIÓN DE LA SEGUNDA DERIVADA Y ESTABILIDAD');
disp('---------------------------------------------------------');
fprintf('Frecuencia del mínimo evaluada:        %.4f Hz\n', f_min_exacto);
fprintf('Valor de la 2da derivada (d^2|Z|/df^2): %.6f\n', d2Z_df2_min);

if d2Z_df2_min > 0
    disp('-> Signo POSITIVO: La curva es cóncava hacia arriba.');
    disp('-> Conclusión: El punto es un MÍNIMO ESTABLE.');
else
    disp('-> Signo NEGATIVO: La curva es cóncava hacia abajo.');
    disp('-> Conclusión: El punto es INESTABLE (Máximo).');
end
disp('---------------------------------------------------------');
