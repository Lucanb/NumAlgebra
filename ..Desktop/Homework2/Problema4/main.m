base = fileparts(mfilename('fullpath'));
addpath(fullfile(base,'functions'));
addpath(fullfile(base, '../Problema3/functions'));
rehash;

A = [1 -1 -1  1;
     1  2  1 -3];
b = [1;1];

x0 = [1;0;-1;0];

x_star = ClosestSolutionToX0(A,b,x0);

disp('Solutia LS cea mai apropiata de x0 este:');
disp(x_star);

disp('Verificare reziduu ||A*x - b||_2:');
r = A*x_star - b;
disp(sqrt(sum(r.*r)));

disp('Distanta ||x - x0||_2:');
d = x_star - x0;
disp(sqrt(sum(d.*d)));

