addpath('functions');

A = [2 1 1;
     1 1 -1;
     1 1 2];

[L, U] = LUBlocuriRecursivDoolittle(A);

disp('L ='); disp(L);
disp('U ='); disp(U);

disp('Doolittle ||A - L*U||_F =');
disp(norm(A - L*U, 'fro'));

[Lb, Ub, Pb] = lu(A);
disp('Matlab check: ||Pb*A - Lb*Ub||_F =');
disp(norm(Pb*A - Lb*Ub, 'fro'));

[L,U,P] = LUBlocuriRecursivPivot(A);
disp('Pivotare ||A - L2*U2||_F =');
disp(norm(P*A - L*U, 'fro'));

A2 = rand(6);
[L2, U2] = LUBlocuriRecursivDoolittle(A2);
disp('Test random Dooltittle: ||A2 - L2*U2||_F =');
disp(norm(A2 - L2*U2, 'fro'));

[L2,U2,P2] = LUBlocuriRecursivPivot(A2);
disp('Test random Pivotare: ||A2 - L2*U2||_F =');
disp(norm(P2*A2 - L2*U2, 'fro'));

