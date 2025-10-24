addpath(fullfile(pwd,'functions'));
%recursive
A = [2 4 1; 6 13 5; 2 19 10];
[P, L, U] = pivotp(A);
disp('A ='), disp(A)
disp('P ='), disp(P)
disp('L ='), disp(L)
disp('U ='), disp(U)
disp('Verificare P*A ≈ L*U')
disp(P*A - L*U)

%iterative
A = [2 4 1; 6 13 5; 2 19 10];
[P, L, U] = pivotp_iterative(A);
disp('A ='), disp(A)
disp('P ='), disp(P)
disp('L ='), disp(L)
disp('U ='), disp(U)
disp('Verificare P*A ≈ L*U')
disp(P*A - L*U)

%Ok cholesky Factorisation : 

A = [4 2 2; 2 10 4; 2 4 9];
H = cholesky(A);
disp('A ='), disp(A)
disp('H ='), disp(H)
disp('Verificare H*H'' ≈ A')
disp(H*H' - A)

% cu prod scalar implementare
A = [4 2 2; 2 10 4; 2 4 9];
H = cholesky_scalarp(A);
disp('A ='), disp(A)
disp('H ='), disp(H)
disp('Verificare H*H'' ≈ A')
disp(H*H' - A)