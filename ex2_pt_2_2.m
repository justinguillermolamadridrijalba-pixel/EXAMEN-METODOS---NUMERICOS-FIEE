disp('=========================================================');
disp('   DERIVADA dV/df MEDIANTE DIFERENCIAS CENTRADAS DE ORDEN 4');
disp('=========================================================');

h = 2.5; %tamaño de paso entre valores de frecuencia%

%VALORES QUE USAREMOS PARA LAS DIFERENCIAS CENTRADAS DE ORDEN 4 PARA F= 40KHZ%

V_35_0 = 1.216; V_37_5 = 1.048; V_40_0 = 0.866; V_42_5 = 0.689; V_45_0 = 0.521;
dv_40_4 = (-V_45_0 + 8*V_42_5 - 8*V_37_5 + V_35_0) / (12 * h);

fprintf('\nFrecuencia: 40.0 kHz\n');
fprintf('Orden 4 (O(h^4)): %.4f V/kHz\n', dv_40_4);

%AHORA HALLAMOS PARA F=70 KHZ%

V_65_0 = 0.018; V_67_5 = 0.096; V_70_0 = 0.197; V_72_5 = 0.318; V_75_0 = 0.452;; 
dv_70_4 = (-V_75_0 + 8*V_72_5 - 8*V_67_5 + V_65_0) / (12 * h);

fprintf('\nFrecuencia: 70.0 kHz\n');
fprintf('Orden 4 (O(h^4)): %.4f V/kHz\n', dv_70_4);

%AHORA HALLAMOS PARA F=100 KHZ%

V_95_0 = 0.856; V_97_5 = 0.894; V_100_0 = 0.926; V_102_5 = 0.954; V_105_0 = 0.980;
dv_100_4 = (-V_105_0 + 8*V_102_5 - 8*V_97_5 + V_95_0) / (12 * h);

fprintf('\nFrecuencia: 70.0 kHz\n');
fprintf('Orden 4 (O(h^4)): %.4f V/kHz\n', dv_100_4);

disp('=========================================================');