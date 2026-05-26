f = [100, 120, 145, 170, 200, 235, 270, 310, 355, 405, 460, 520, 585, 655, 730, 810, 895, 985, 1080, 1180, 1290, 1410, 1540, 1680, 1830, 1990, 2160, 2340, 2530, 2730];

Z = [152.3, 149.1, 146.8, 144.9, 142.0, 139.5, 137.9, 136.1, 134.8, 133.6, 132.7, 131.9, 131.4, 131.1, 130.9, 131.0, 131.3, 131.9, 132.7, 133.8, 135.2, 136.9, 138.9, 141.1, 143.5, 146.1, 149.0, 152.2, 155.6, 159.2];

% Malla densa de 500 puntos para trazos perfectos
f_fina = linspace(min(f), max(f), 500);

% Evaluamos el Spline Cúbico
Z_spline_fina = spline(f, Z, f_fina);

% Realizamos las pruebas con el Polinomio de Grado 10 Seleccionado
[p10, S10, mu10] = polyfit(f, Z, 10);
Z_poli_fina = polyval(p10, f_fina, S10, mu10);

% Gráfica Comparativa Duplicada
figure;
hold on;
plot(f, Z, 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 5, 'DisplayName', 'Datos Originales');
plot(f_fina, Z_spline_fina, 'b-', 'LineWidth', 2, 'DisplayName', 'Spline Cúbico');
plot(f_fina, Z_poli_fina, 'g--', 'LineWidth', 1.5, 'DisplayName', 'Polinomio Grado 10');

title('Comparación en Malla Fina: Spline vs Polinomio Seleccionado', 'FontSize', 12);
xlabel('Frecuencia (Hz)');
ylabel('Magnitud de Impedancia |Z| (\Omega)');
ylim([125 165]); % Encuadre óptimo de la escala
grid on;
legend('Location', 'best');
hold off;
