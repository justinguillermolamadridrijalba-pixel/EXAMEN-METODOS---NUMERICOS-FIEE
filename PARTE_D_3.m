
f = [100, 120, 145, 170, 200, 235, 270, 310, 355, 405, 460, 520, 585, 655, 730, 810, 895, 985, 1080, 1180, 1290, 1410, 1540, 1680, 1830, 1990, 2160, 2340, 2530, 2730];

Z = [152.3, 149.1, 146.8, 144.9, 142.0, 139.5, 137.9, 136.1, 134.8, 133.6, 132.7, 131.9, 131.4, 131.1, 130.9, 131.0, 131.3, 131.9, 132.7, 133.8, 135.2, 136.9, 138.9, 141.1, 143.5, 146.1, 149.0, 152.2, 155.6, 159.2];

pp_Z = spline(f, Z);
[nodos, coefs] = unmkpp(pp_Z);
pp_d1 = mkpp(nodos, [3*coefs(:,1), 2*coefs(:,2), coefs(:,3)]); 

% Tomamos la raíz alta que calculamos en el inciso 1 y 2
F_fun = @(x) ppval(pp_Z, x) - 150;
raiz_alta = fzero(F_fun, 2200);

% Sensibilidad matemática = Inversa de la primera derivada
derivada_raiz = ppval(pp_d1, raiz_alta);
sensibilidad = 1 / derivada_raiz;

disp('---------------------------------------------------------');
disp('   INCISO 3: CÁLCULO DE SENSIBILIDAD');
disp('---------------------------------------------------------');
fprintf('Derivada (d|Z|/df) en f = %.4f Hz : %.4f Ohms/Hz\n', raiz_alta, derivada_raiz);
fprintf('Sensibilidad inversa (df/d|Z|)     : %.4f Hz/Ohm\n', sensibilidad);
disp('---------------------------------------------------------');+
