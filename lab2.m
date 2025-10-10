function c = produs(a, b)
    c = a * b;
end

produs(4,5);

X = [1 -1 0 2 3]
A = [1 2 -1;-1 0 1;0,2,3]
sum(X);
sum(A);
sum(sum(A));
max(X);
max(max(A));
X>1;
x(x>0) %ia elementele pozitive - la matrice daca faci la fel nu mai stie de unde sa ia si face vector
%{
 daca vreau matrice cu 1 s 0 iau pe col sau pe linii si aplic operatorul.
 for i = a : h : b %h e pasul si implicit daca nu am acel h o sa faca cu o pozitie   
 end
aici indicele incepe de la 1
%}

function s = suma1(A)
     s = 0;                   
    for i = 1:numel(A)
        s = s + A(i);
    end
end

function s = suma2(A)
    s = sum(A(:));
end

function s = suma3(A)
    s = 0;
    [m,n] = size(A);
    for i = 1:m
        for j = 1:n
            s = s + A(i,j);
        end
    end
end 
suma1(A);
suma2(A);
suma3(A);


function  s = suma4(A) 
    s = sum(A(A > 0));
end

%functional daca vreau el la patrat
%{
f = @(x) (x^2);
s = sum(f(A(A > 0)))
%}
f = @(x) x.^2;            % . pt element-wise pătrat
s = sum(f(A(A > 0)));     

suma4(A);
function s = suma5(A)
    s = 0;
    [m,n] = size(A);
    for i = 1:m
        for j = 1:n
            if(A(i,j)>0)
                s = s + A(i,j);
            end
        end
    end
end %pot pune in fisiere din aeeasi cale si apelez direct functiile sau daca nu e aceeasi cale - trb importate.

suma5(A);

%Factorial

function n= fact(b)
   n=1;
    while (b>0)
      n = n*b;
      b=b-1;
   end
end

fact(5)

function f = factorialF(n)
    f = inner(n);
    function y = inner(x)
        if x <= 1
            y = 1;
        else
            y = x * inner(x-1);
        end
    end
end

fact(5)
f = @(n) arrayfun(@(x) prod(1:x), n);
f(5)

function [isSquare, isLowerTri, isUpperTri] = checkMatrix(A)
    [m, n] = size(A);
    isSquare = (m == n);
    
    isLowerTri = false;
    isUpperTri = false;
    
    if isSquare
        isLowerTri = isequal(A, tril(A));
        isUpperTri = isequal(A, triu(A));
    end
end

function ok = checkTriangular2(A)
    [m,n] = size(A)
    if m ~= n
        ok = false;
        return
    end
    isLower = true;
    isUpper = true;
    for i = 1:m
        for j = 1:n
            if j > i && A(i,j) ~= 0
                isUpper = false;
            end
            if i > j && A(i,j) ~= 0
                isLower = false;
            end
        end
    end
    ok = isLower || isUpper;
end

function ok = isInvertible(A)
    m = length(A(:,1));
    n = length(A(1,:));
    if m ~= n
        ok = false;
        return
    end
    ok = true;
    for i = 1:m
        if A(i,i) == 0
            ok = false;
            return
        end
    end
end

function x = forward(L, b)
    [n, m] = size(L);
    [isSq, isLower, isUpper] = checkMatrix(L);
    ok = isInvertible(L);
    if isLower && isSq && ok
        x = zeros(n, 1);
        x(1) = b(1) / L(1, 1);
        for i = 2:n
            s = 0;
            for j = 1:i-1
                s = s + L(i, j) * x(j);
            end
            x(i) = (b(i) - s) / L(i, i);
        end
    else
        error("Matrix must be square, lower triangular, and invertible");
    end
    x = x(:);
end

function x = backward(U, b)
    [n, m] = size(U);
    [isSq, isLower, isUpper] = checkMatrix(U);
    ok = isInvertible(U);
    if isUpper && isSq && ok
        x = zeros(n, 1);
        x(n) = b(n) / U(n, n);
        for i = n-1:-1:1
            s = 0;
            for j = i+1:n
                s = s + U(i, j) * x(j);
            end
            x(i) = (b(i) - s) / U(i, i);
        end
    else
        error("Matrix must be square, upper triangular, and invertible");
    end
    x = x(:);
end

function x = solveTriangular(A, b)
    [~, ~, isUpper] = checkMatrix(A);
    if isUpper
        x = backward(A, b);
    else
        x = forward(A, b);
    end
end

solveTriangular([1 0 0; 1 -1 0; -2 1 -2], [1 0 -3])
solveTriangular([1 0 0; 1 -1 0; -2 1 1], [1 0 -3])