disp('OBTENCION DE LA RAIZ POR METODO DE BISECCION')
disp('=============================================')

f_total = 10.0:2.5:107.5;

V_total = [0.842, 0.911, 0.986, 1.062, 1.143, 1.227, 1.314, 1.401, 1.482, 1.551, 1.216, 1.048, 0.866, 0.689, 0.521, 0.364, 0.223, 0.103, 0.012, -0.041, -0.057, -0.034, 0.018, 0.096, 0.197, 0.318, 0.452, 0.579, 0.700, 0.809, 0.611, 0.688, 0.756, 0.811, 0.856, 0.894, 0.926, 0.954, 0.980, 1.004];

Z_total = [182.4, 178.9, 175.1, 171.0, 166.8, 162.7, 158.9, 155.4, 152.0, 149.0, 146.1, 145.2, 145.8, 147.3, 149.9, 153.5, 158.0, 163.2, 168.9, 174.8, 180.5, 186.2, 191.5, 196.2, 200.1, 203.1, 205.2, 206.3, 206.1, 204.7, 198.0, 194.4, 190.9, 187.8, 185.1, 183.0, 181.6, 180.8, 180.6, 180.9];

%CONSTRUIMOS EL SPLINE CUBICO ORIGINAL PARA EXTRAER EN UNA MATRIZ SUS COEFICIENTES%
pp_v = spline(f_total, V_total);
M_fun = @(x) ppval (pp_v,x); %asi armamos nuestra funcion M(x) splin cubicp%

%APLICAMOS EL METODO DE BISECCION SEGUN LA TEORIA DE CLASE%

a1 = 55.0;
b1 = 57.5;

tol = 1e-5;
max_itera = 50;
itera = 0;

disp('=========================================================');
disp('   BISECCIÓN: PRIMERA RAÍZ (Intervalo [55.0 , 57.5])');
disp('=========================================================');
fprintf('Iter |      a      |      b      |      c      |    V(c)    \n');

while (b1 - a1)/2 > tol && itera < max_itera
    itera = itera + 1;
    c1=(a1 + b1)/2;
    fprintf('%4d | %11.4f | %11.4f | %11.4f | %11.4f\n', itera, a1, b1, c1, M_fun(c1));

    if M_fun(c1) == 0
        break;
    elseif M_fun(a1)*M_fun(c1) < 0
        b1 = c1;
    else
        a1 = c1;
    end
end
raiz_1 = (a1 + b1)/2;
fprintf('\n=> Primera raíz hallada: %.4f kHz (en %d iteraciones)\n', raiz_1, itera);
disp('=========================================================');
