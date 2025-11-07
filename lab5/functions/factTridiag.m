function [L, U] = factTridiag(A)
    [n, m] = size(A);
    if n ~= m
        error('Matrix must be square.');
    end
    if ~tridiagonal(A)
        fprintf('Matrix is not tridiagonal.\n');
        L = []; U = [];
        return;
    end
    alpha = diag(A);
    if n > 1
        beta = diag(A, -1);
        c = diag(A, 1);
    else
        beta = [];
        c = [];
    end
    l = zeros(n-1,1);
    u = zeros(n,1);
    u(1) = alpha(1);
    for k = 2:n
        l(k-1) = beta(k-1) / u(k-1);
        u(k) = alpha(k) - l(k-1) * c(k-1);
    end
    L = eye(n);
    U = diag(u);
    if n > 1
        L = L + diag(l, -1);
        U = U + diag(c, 1);
    end
end
