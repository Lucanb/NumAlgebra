addpath('functions');

a = eps(1.0);

A = [a 1 1;
     1 -1 1;
     1 1 2];

b = [1; 1; 1];

x_custom = SolutiePivotareTotala(A, b);

x_builtin = A \ b;

disp('x (custom LU pivotare totala) =');
disp(x_custom);

disp('x (builtin A\\b) =');
disp(x_builtin);

disp('||x_custom - x_builtin||_2 =');
disp(norm(x_custom - x_builtin, 2));

disp('||A*x_custom - b||_2 =');
disp(norm(A*x_custom - b, 2));

[P, Q, L, U] = LUPivotareTotala(A);
disp('Verificare ||P*A*Q - L*U||_F =');
disp(norm(P*A*Q - L*U, 'fro'));

A2 = [2 1 1;
      4 3 3;
      8 7 9];
b2 = [1; 2; 3];

x2_custom = SolutiePivotareTotala(A2, b2);
x2_builtin = A2 \ b2;

disp('Test 2: ||x2_custom - x2_builtin||_2 =');
disp(norm(x2_custom - x2_builtin, 2));

