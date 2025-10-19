function [L,U] = FactLU(A)
[m,n] = size(A);
L = eye(n);
for k=1:n-1
    if A(k,k) == 0
        error('factorizarea nu poate fi facuta')
    end
    M = eye(n);
    M(k+1:n,k) = -A(k+1:n,k)/A(k,k);
    A = M*A;
    L = L - (M - eye(n));
end
U = A;
end
