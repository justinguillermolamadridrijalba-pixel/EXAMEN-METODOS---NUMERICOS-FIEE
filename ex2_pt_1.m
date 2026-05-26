%%PREGUNTA1
%%IMPRIMIMOS Y HALLAMOS LOS VALORES ESTIMADOS DE LAS FRECUENCIAS
%%41KHZ Y 71KHZ
disp('  =========================================================    ')
disp('  ESTIMAMOS EL VALOR DE V Y |Z| PARA LA FRECUENCIA DE 41KHz    ')
disp('  =========================================================    ')

%PARA 41KHZ SUS PUNTOS MAS CERCANOS SON X0=37.5 X1=40 X2=42.5%
f_41 = [37.5, 40, 42.5];
V_41_datos = [1.048, 0.866, 0.689];
Z_41_datos = [145.2, 145.8, 147.3];

%PARA UNA IMPRESION DIRECTA DEL POLINOMIO DE LAGRANGE USAMOS LA
%FUNCION POLYFIT%

p_V_41 = polyfit (f_41, V_41_datos, 2);
p_Z_41 = polyfit (f_41, Z_41_datos, 2);

%EVALUAMOS LA FUNCION PARA 41KHz%

val_V_41 = polyval(p_V_41, 41.0);
val_Z_41 = polyval(p_Z_41, 41.0);

%MOSTRAMOS LOS RESULTADOS%

disp('--- 1. Resultados para f = 41.0 kHz ---');
fprintf('Polinomio V(f) = (%.6f)*f^2 + (%.6f)*f + (%.6f)\n', p_V_41(1), p_V_41(2), p_V_41(3));
fprintf('Estimación V(41.0) = %.4f V\n\n', val_V_41);

fprintf('Polinomio |Z|(f) = (%.6f)*f^2 + (%.6f)*f + (%.6f)\n', p_Z_41(1), p_Z_41(2), p_Z_41(3));
fprintf('Estimación |Z|(41.0) = %.4f Ohmios\n\n', val_Z_41);