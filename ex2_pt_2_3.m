disp('=========================================================');
disp('   DERIVADA dV/df MEDIANTE DIFERENCIAS PROGRESIVAS DE ORDEN 2');
disp('=========================================================');

h = 2.5; %tamaño de paso entre valores de frecuencia%

%VALORES QUE UTILIZAREMOS%
v_10_0 = 0.842; v_12_5 = 0.911; v_15_0 = 0.986;

%REPRESENTAMOS LA FORMULA DE LA DIFERENCIAS PROGRESIVAS DE ORDEN 2%

dv_10_pro = (-3*v_10_0 + 4*v_12_5 - v_15_0) / (2*h);

fprintf('Frecuencia: 10.0 kHz (Extremo inferior)\n');
fprintf('Orden 2 (O(h^2)): %.4f V/kHz\n', dv_10_pro);
disp('=========================================================');