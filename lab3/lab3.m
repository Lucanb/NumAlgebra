function lab3
addpath(fullfile(pwd,'functions'));
A = [2 -1 1; 3 3 9; 3 3 5];
b = [2; -1; 4];
disp('Matricea A:')
disp(A)
disp('Vectorul b:')
disp(b)
[L,U] = FactLU(A);
disp('Matricea L:')
disp(L)
disp('Matricea U:')
disp(U)
x = salLU(A,b);
disp('Solutia sistemului x:')
disp(x)
end
