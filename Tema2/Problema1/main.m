base = fileparts(mfilename('fullpath'));
addpath(fullfile(base,'functions'));
rehash;

A = [eps(1.0) 1 1;
     1       -1 1;
     1        1 2];
b = [1;1;1];

x = RafinarePivotareTotala(A,b,1e-12);
disp(x);

x0 = A\b;
disp('||x - (A\\b)||_2 =');
disp(sqrt(sum((x-x0).^2)));

