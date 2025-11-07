function [L, U] = factLU(A)
n = size(A,1);
isTri = true;

for i = 1:n
    for j = 1:n
        if abs(i-j) > 1 && A(i,j) ~= 0
            isTri = false;
            break;
        end
    end
    if ~isTri
        break;
    end
end

if isTri
    [L, U] = factTridiag(A);
else
    L = eye(n);
    U = A;
    for k = 1:n-1
        for i = k+1:n
            L(i,k) = U(i,k) / U(k,k);
            U(i,k:n) = U(i,k:n) - L(i,k)*U(k,k:n);
        end
    end
end
end
