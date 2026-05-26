disp('=========================================================');
disp('   DERIVADA dV/df MEDIANTE DIFERENCIAS CENTRADAS DE ORDEN 2');
disp('=========================================================');

h = 2.5; %tamaño de paso entre valores de frecuencia%

%VALORES QUE USAREMOS PARA LAS DIFERENCIAS CENTRADAS DE ORDEN 2 PARA F= 40KHZ%

V_37_5 = 1.048; V_42_5 = 0.689; 
dv_40_2 = (V_42_5 - V_37_5) / (2 * h);

fprintf('\nFrecuencia: 40.0 kHz\n');
fprintf('Orden 2 (O(h^2)): %.4f V/kHz\n', dv_40_2);

%AHORA HALLAMOS PARA F=70 KHZ%

V_67_5 = 0.096; V_72_5 = 0.318; 
dv_70_2 = (V_72_5 - V_67_5) / (2 * h);

fprintf('\nFrecuencia: 70.0 kHz\n');
fprintf('Orden 2 (O(h^2)): %.4f V/kHz\n', dv_70_2);

%AHORA HALLAMOS PARA F=100 KHZ%

V_97_5 = 0.894; V_102_5 = 0.954; 
dv_100_2 = (V_102_5 - V_97_5) / (2 * h);

fprintf('\nFrecuencia: 70.0 kHz\n');
fprintf('Orden 2 (O(h^2)): %.4f V/kHz\n', dv_100_2);

disp('=========================================================');
