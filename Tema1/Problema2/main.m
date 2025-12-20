addpath('functions');

a = eps(1.0);

A = [a 1 1;
     1 -1 1;
     1 1 2];

b = [1; 1; 1];

x_sol = SolutiePivotareTotala(A, b);

x1_matlab = A \ b;

disp('Solutia LU - pivotare totala x =');
disp(x_sol);

disp('Solutia matlab x =');
disp(x1_matlab);

disp('||x_sol - x_matlab||_2 =');
disp(norm(x_sol - x1_matlab, 2));

disp('||A*x_sol - b||_2 =');
disp(norm(A*x_sol - b, 2));

[P, Q, L, U] = LUPivotareTotala(A);
disp('Verificare ||P*A*Q - L*U||_F =');
disp(norm(P*A*Q - L*U, 'fro'));

A2 = [2 1 1;
      4 3 3;
      8 7 9];
b2 = [1; 2; 3];

x2_solution = SolutiePivotareTotala(A2, b2);
x2_matlab = A2 \ b2;

disp('Test 2: ||x2_custom - x2_builtin||_2 =');
disp(norm(x2_solution - x2_matlab, 2));

