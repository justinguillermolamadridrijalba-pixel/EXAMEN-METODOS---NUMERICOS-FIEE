f = [100, 120, 145, 170, 200, 235, 270, 310, 355, 405, 460, 520, 585, 655, 730, 810, 895, 985, 1080, 1180, 1290, 1410, 1540, 1680, 1830, 1990, 2160, 2340, 2530, 2730];

Z = [152.3, 149.1, 146.8, 144.9, 142.0, 139.5, 137.9, 136.1, 134.8, 133.6, 132.7, 131.9, 131.4, 131.1, 130.9, 131.0, 131.3, 131.9, 132.7, 133.8, 135.2, 136.9, 138.9, 141.1, 143.5, 146.1, 149.0, 152.2, 155.6, 159.2];


%AQUI LO QUE HACEMOS ES "ENGAÑAR A LA FUNCION PLOT" ES DECIR, EN VEZ DE HACER QUE LA FUNCION PASE POR LOS 30 PUNTOS A EVALUAR, LO QUE HACEMOS ES QUE EL RANGO DE FRECUENCIAS SE HA DIVIDIDO EN 500 ESPACIOS PEQUEÑOS PARA QUE LA FUNCION PASE POR AHI%
f_densa = linspace(min(f), max(f), 500);

%TRAS INVESTIGAR, LO QUE SE HACE PARA QUE UNA FUNCION DE MENOR GRADO PASE
%POR UNA CANTIDAD DE PUNTOS MUCHO MAYOR SE CONOCE COMO "AJUSTES DE MINIMOS
%CUADRADOS" EN MATALAB ESTI SE LOGRA CON LA FUNCION "POLYFIT"
[p5, S5, mu5]   = polyfit(f, Z, 5);
[p10, S10, mu10] = polyfit(f, Z, 10);
[p15, S15, mu15] = polyfit(f, Z, 15);

% LUEGO, EVALUAMOS LOS POLINOMIOS EN EL VECTOR DENSO UTILIZANDO POLYVAL
Z_grado5  = polyval(p5, f_densa, S5, mu5);
Z_grado10 = polyval(p10, f_densa, S10, mu10);
Z_grado15 = polyval(p15, f_densa, S15, mu15);

% Configuración y creación de la gráfica
figure;
hold on; % CON ESTO, HACEMOS QUE EL SE PUEDAN HACER GRAFICAS UNA ENCIMA DE LA OTRA Y VER LAS COMPARATIVAS

% Dibujamos primero los puntos de datos reales (en negro)
plot(f, Z, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6, 'DisplayName', 'Datos Medidos');

% Dibujamos las curvas de los polinomios con distintos colores
plot(f_densa, Z_grado5, 'b-', 'LineWidth', 2, 'DisplayName', 'Ajuste Grado 5');
plot(f_densa, Z_grado10, 'g-', 'LineWidth', 2, 'DisplayName', 'Ajuste Grado 10');
plot(f_densa, Z_grado15, 'm--', 'LineWidth', 2, 'DisplayName', 'Ajuste Grado 15');

% Estética y etiquetas para el informe
title('Comparación de Ajustes Polinómicos (Grados 5, 10 y 15)', 'FontSize', 14);
xlabel('Frecuencia (Hz)', 'FontSize', 12);
ylabel('Magnitud de Impedancia |Z| (\Omega)', 'FontSize', 12);
legend('Location', 'best', 'FontSize', 11);
grid on;
ylim([125 165]); % Ajustamos la ventana para ver bien el valle
hold off;
