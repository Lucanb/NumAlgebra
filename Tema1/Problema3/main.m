clear; clc;
addpath('functions');

A = [2 1 1;
     1 1 -1;
     1 1 2];

[L, U] = LUDoolittle(A);

disp('L (Doolittle) =');
disp(L);

disp('U (Doolittle) =');
disp(U);

disp('||A - L*U||_F =');
disp(norm(A - L*U, 'fro'));

L_expected = [1 0 0;
              1/2 1 0;
              1/2 1 1];

U_expected = [2 1 1;
              0 1/2 -3/2;
              0 0 3];

disp('||L - L_expected||_F =');
disp(norm(L - L_expected, 'fro'));

disp('||U - U_expected||_F =');
disp(norm(U - U_expected, 'fro'));

[Lb, Ub, Pb] = lu(A);
disp('Verificare built-in: ||Pb*A - Lb*Ub||_F =');
disp(norm(Pb*A - Lb*Ub, 'fro'));

