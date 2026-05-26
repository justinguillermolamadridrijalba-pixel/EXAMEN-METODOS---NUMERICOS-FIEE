%PREGUNTA 1% 

%Grafique los datos |Z|(f). Discuta brevemente la tendencia y posible físico detrás de la forma observada.
%

%Definimo los valores de frecuencia e impedancia%
f = [100, 120, 145, 170, 200, 235, 270, 310, 355, 405, 460, 520, 585, 655, 730, 810, 895, 985, 1080, 1180, 1290, 1410, 1540, 1680, 1830, 1990, 2160, 2340, 2530, 2730];

z = [152.3, 149.1, 146.8, 144.9, 142.0, 139.5, 137.9, 136.1, 134.8, 133.6, 132.7, 131.9, 131.4, 131.1, 130.9, 131.0, 131.3, 131.9, 132.7, 133.8, 135.2, 136.9, 138.9, 141.1, 143.5, 146.1, 149.0, 152.2, 155.6, 159.2];

%Creamos la grafica para representar los datos%
figure;
plot(f, z, '-o', 'LineWidth', 1.5, 'MarkerSize', 6, 'MarkerFaceColor', 'b');

%Colocamos nombres y titulos a la grafica%
title('Respuesta en Frecuencia: Magnitud de impedancia obtenida', 'FontSize', 14);
xlabel('Frecuencia (Hz)', 'FontSize', 12);
ylabel('Magnitud de la Impedancia |z| (\Omega)', 'FontSize', 12);

grid on;
