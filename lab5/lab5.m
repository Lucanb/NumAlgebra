addpath('functions');

A = [2 1 0 0;1 2 1 0;0 1 2 1;0 0 1 1]; 
[L,U] = factTridiag(A);

disp('Matricea L:');
disp(L);
disp('Matricea U:');
disp(U);

disp('Verificare A - L*U:');
disp(norm(A - L*U));