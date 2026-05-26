%Hallamos el splin cubico y su grafica representativa%

f = [100, 120, 145, 170, 200, 235, 270, 310, 355, 405, 460, 520, 585, 655, 730, 810, 895, 985, 1080, 1180, 1290, 1410, 1540, 1680, 1830, 1990, 2160, 2340, 2530, 2730];

Z = [152.3, 149.1, 146.8, 144.9, 142.0, 139.5, 137.9, 136.1, 134.8, 133.6, 132.7, 131.9, 131.4, 131.1, 130.9, 131.0, 131.3, 131.9, 132.7, 133.8, 135.2, 136.9, 138.9, 141.1, 143.5, 146.1, 149.0, 152.2, 155.6, 159.2];

%Creación de la malla fina (500 puntos) para trazar el Spline continuo
f_fina = linspace(min(f), max(f), 500);

%Construcción y evaluación del Spline con la función nativa de MATLAB
Z_spline = spline(f, Z, f_fina);

%Graficación del Spline Cúbico Puro
figure;
plot(f, Z, 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 5, 'DisplayName', 'Datos de Laboratorio');
hold on;
plot(f_fina, Z_spline, 'b-', 'LineWidth', 2, 'DisplayName', 'Spline Cúbico Natural');

title('Interpolación por Spline Cúbico Natural', 'FontSize', 12);
xlabel('Frecuencia (Hz)', 'FontSize', 11);
ylabel('Magnitud de Impedancia |Z| (\Omega)', 'FontSize', 11);
grid on;
legend('Location', 'best');
hold off;
