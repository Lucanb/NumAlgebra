addpath('functions');

A = [1 0 -1;
     0 1  1;
     2 0  1];

[U,S,V] = my_svd(A);

disp('U =');
disp(U);

disp('S =');
disp(S);

disp('V =');
disp(V);

disp('Eroare ||A - U*S*V''|| =');
disp(norm(A - U*S*V','fro'));