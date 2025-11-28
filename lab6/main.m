addpath('functions')
M = [1 1000;
     1 2000;
     2 5000;
     3 2000;
     5 3000;
     6 2000;
     6 3000;
     7 4000;
     7 2000;
     7 5000;
     8 5000;];
 
[m,n] = size(M);

[x, err, rank_ok] = LSC(M, n-1);
disp('x =');
disp(x);
disp(['err = ', num2str(err)]);
disp(['rank_ok = ', num2str(rank_ok)]);

deg = 100;
tol = 1e-6;      
max_iter = 100

[coeff, err, rank_ok] = lsc_poly(M, deg, tol, max_iter)

disp('x =');
disp(x);
disp('Polynomial coefficients =');
disp(coeff);
disp(['Polynomial fit error = ', num2str(err)]);

M = [1 1000;
     1 2000;
     2 5000;
     3 2000;
     5 3000;
     6 2000;
     6 3000;
     7 4000;
     7 2000;
     7 5000;
     8 5000];

steps = 5;  % câte predic?ii viitoare

x_preds = recursive_predict(M, steps);

disp('Predic?ii salarii viitoare:');
disp(x_preds);
