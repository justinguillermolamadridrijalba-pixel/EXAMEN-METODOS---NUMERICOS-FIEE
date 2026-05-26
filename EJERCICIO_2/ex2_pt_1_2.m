%%PREGUNTA1
%%IMPRIMIMOS Y HALLAMOS LOS VALORES ESTIMADOS DE LAS FRECUENCIAS
%%41KHZ Y 71KHZ
disp('  =========================================================    ')
disp('  ESTIMAMOS EL VALOR DE V Y |Z| PARA LA FRECUENCIA DE 73KHz    ')
disp('  =========================================================    ')

%PARA 41KHZ SUS PUNTOS MAS CERCANOS SON X0=70.0 X1=72.5 X2=75.0%
f_73 = [70.0, 72.5, 75];
V_73_datos = [0.197, 0.318, 0.452];
Z_73_datos = [200.1, 203.1, 205.2];

%PARA UNA IMPRESION DIRECTA DEL POLINOMIO DE LAGRANGE USAMOS LA
%FUNCION POLYFIT%

p_V_73 = polyfit (f_73, V_73_datos, 2);
p_Z_73 = polyfit (f_73, Z_73_datos, 2);

%EVALUAMOS LA FUNCION PARA 41KHz%

val_V_73 = polyval(p_V_73, 41.0);
val_Z_73 = polyval(p_Z_73, 41.0);

%MOSTRAMOS LOS RESULTADOS%

disp('--- 1. Resultados para f = 41.0 kHz ---');
fprintf('Polinomio V(f) = (%.6f)*f^2 + (%.6f)*f + (%.6f)\n', p_V_73(1), p_V_73(2), p_V_73(3));
fprintf('Estimación V(41.0) = %.4f V\n\n', val_V_73);

fprintf('Polinomio |Z|(f) = (%.6f)*f^2 + (%.6f)*f + (%.6f)\n', p_Z_73(1), p_Z_73(2), p_Z_73(3));
fprintf('Estimación |Z|(41.0) = %.4f Ohmios\n\n', val_Z_41);
