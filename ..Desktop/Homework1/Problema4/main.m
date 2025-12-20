addpath('functions');

A = [2 1 1;
     1 1 -1;
     1 1 2];

[L, U] = LUBlocuriRecursiv(A);

disp('L ='); disp(L);
disp('U ='); disp(U);

disp('||A - L*U||_F =');
disp(norm(A - L*U, 'fro'));

[Lb, Ub, Pb] = lu(A);
disp('Built-in check: ||Pb*A - Lb*Ub||_F =');
disp(norm(Pb*A - Lb*Ub, 'fro'));

A2 = rand(6);
[L2, U2] = LUBlocuriRecursiv(A2);
disp('Test random: ||A2 - L2*U2||_F =');
disp(norm(A2 - L2*U2, 'fro'));

