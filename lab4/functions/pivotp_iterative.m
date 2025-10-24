function [P, L, U] = pivotp_iterative(A)
[m, n] = size(A);
if m ~= n
    error('Matricea trebuie sa fie patratica')
end
P = eye(n);
L = eye(n);
U = A;
for k = 1:n-1
    [~, pivot] = max(abs(U(k:n,k)));
    pivot = pivot + k - 1;
    if pivot ~= k
        U([k pivot], :) = U([pivot k], :);
        P([k pivot], :) = P([pivot k], :);
        if k > 1
            L([k pivot],1:k-1) = L([pivot k],1:k-1);
        end
    end
    if abs(U(k,k)) < eps
        error('Pivot nul')
    end
    L(k+1:n,k) = U(k+1:n,k) / U(k,k);
    U(k+1:n,:) = U(k+1:n,:) - L(k+1:n,k) * U(k,:);
end
end