f = [100, 120, 145, 170, 200, 235, 270, 310, 355, 405, 460, 520, 585, 655, 730, 810, 895, 985, 1080, 1180, 1290, 1410, 1540, 1680, 1830, 1990, 2160, 2340, 2530, 2730];

Z = [152.3, 149.1, 146.8, 144.9, 142.0, 139.5, 137.9, 136.1, 134.8, 133.6, 132.7, 131.9, 131.4, 131.1, 130.9, 131.0, 131.3, 131.9, 132.7, 133.8, 135.2, 136.9, 138.9, 141.1, 143.5, 146.1, 149.0, 152.2, 155.6, 159.2];

Z_th = 150;
pp_Z = spline(f, Z);
[nodos, coefs] = unmkpp(pp_Z);
pp_d1 = mkpp(nodos, [3*coefs(:,1), 2*coefs(:,2), coefs(:,3)]); % Derivada

F_fun = @(x) ppval(pp_Z, x) - Z_th; 
dF_fun = @(x) ppval(pp_d1, x); 

tol = 1e-4; % Tolerancia para 4 decimales
max_iter = 50;

% --- MÉTODO 1: BISECCIÓN (Intervalo [2160, 2340]) ---
a = 2160; b = 2340;
iter_bis = 0;
disp('======================================================');
disp('   TABLA DE ITERACIONES: MÉTODO DE BISECCIÓN');
disp('======================================================');
fprintf('Iter |      a      |      b      |      c      |    F(c)    \n');
while (b - a)/2 > tol && iter_bis < max_iter
    iter_bis = iter_bis + 1;
    c = (a + b)/2;
    fprintf('%4d | %11.4f | %11.4f | %11.4f | %11.4f\n', iter_bis, a, b, c, F_fun(c));
    if F_fun(c) == 0, break;
    elseif F_fun(a)*F_fun(c) < 0, b = c;
    else, a = c; end
end
fprintf('=> Bisección finalizada en %d iteraciones. Raíz: %.4f Hz\n\n', iter_bis, (a+b)/2);

% --- MÉTODO 2: NEWTON-RAPHSON (Punto inicial f0 = 2250) ---
f0 = 2250; 
iter_newt = 0;
disp('======================================================');
disp('   TABLA DE ITERACIONES: MÉTODO DE NEWTON-RAPHSON');
disp('======================================================');
fprintf('Iter |     f_i     |   F(f_i)   |  F''(f_i)   |   f_{i+1}  \n');
while iter_newt < max_iter
    iter_newt = iter_newt + 1;
    F_val = F_fun(f0);
    dF_val = dF_fun(f0);
    f1 = f0 - F_val/dF_val;
    fprintf('%4d | %11.4f | %10.4f | %10.4f | %11.4f\n', iter_newt, f0, F_val, dF_val, f1);
    if abs(f1 - f0) < tol, break; end
    f0 = f1;
end
fprintf('=> Newton-Raphson finalizado en %d iteraciones. Raíz: %.4f Hz\n', iter_newt, f1);
