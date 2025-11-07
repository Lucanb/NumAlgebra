addpath('functions');

A = [2 1 0 0; 1 2 1 0; 0 1 2 1; 0 0 1 1];
[L, U] = factTridiag(A);

disp('Matricea L:')
disp(L)
disp('Matricea U:')
disp(U)

disp('Verificare A - L*U:')
disp(norm(A - L*U))

A = [2 -1 0; -1 2 -1; 0 -1 2];
B = [4 2 0; 3 6 -4; 2 1 8];

b1 = [1; 0; 1];
b2 = [12; -25; 32];

[x1, errs1, it1] = rafine_Decomp(A, b1, 1e-10, 10);
[x2, errs2, it2] = rafine_Decomp(B, b2, 1e-10, 10);

disp('Solutie A (tridiagonala):')
disp(x1)
disp('Numar iteratii:')
disp(it1)
disp('Erori per iteratie:')
disp(errs1)

disp('Solutie B (generala):')
disp(x2)
disp('Numar iteratii:')
disp(it2)
disp('Erori per iteratie:')
disp(errs2)

A = [1 1 1; 
     1 1.0001 1; 
     1 1 1.0002];
b = [3.0001; 3.0002; 3.0003];

fprintf('Cond(A) = %.2e\n', cond(A))

[L,U] = factLU(A);
y = forward(L, b);
x0 = backward(U, y);

fprintf('\nSoluția directă (fără rafinare):\n')
disp(x0)

[x_refined, errs, it] = rafine_Decomp(A, b, 1e-12, 10);

fprintf('Soluția rafinată:\n')
disp(x_refined)

fprintf('Norma reziduului inițial: %.2e\n', norm(b - A*x0))
fprintf('Norma reziduului final:   %.2e\n', norm(b - A*x_refined))

