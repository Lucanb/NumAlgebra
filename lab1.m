%{
A = [1 2 3; 4 5 6];
B = [7 3 2; 3 2 1];
A = A .* B;
A = sqrt(A);

C = zeros(7);
D = rand(7);
E = ones(7);

C = C+D*E;
%}

A =zeros(7,8);
B = eye(7,7) * (-1);
C = zeros(1,7);
B = [C;B];
C = 3*ones(1,8); 
D = (-1) * ones(1,8);
B = [C(:) B];
B = [B D(:)]

a =2;
b = 5;
h = 0.2;
n = 6;
a:h:b;
linspace(a,b,n)


a = input('a=');
b = input('b=');
c = a+b;
disp(c)