addpath(fullfile(pwd,'functions'));
A = [2 4 1; 6 13 5; 2 19 10];
[P, L, U] = pivotp(A);
disp('A ='), disp(A)
disp('P ='), disp(P)
disp('L ='), disp(L)
disp('U ='), disp(U)
disp('Verificare P*A ≈ L*U')
disp(P*A - L*U)