function [U,S,V] = my_svd(A)
    [m,n] = size(A);
    if m < n
        [Ut,St,Vt] = my_svd(A');
        U = Vt;
        S = St';
        V = Ut;
        return
    end

    B = A' * A;
    [V,D] = eig(B);
    d = diag(D);
    [d,idx] = sort(d,'descend');
    V = V(:,idx);
    d(d < 0) = 0;
    s = sqrt(d);
    tol = 1e-12;
    r = sum(s > tol);

    if r == 0
        U = eye(m);
        V = eye(n);
        S = zeros(m,n);
        return
    end

    s = s(1:r);
    V = V(:,1:r);

    Uthin = A * V * diag(1 ./ s);

    Ufull = zeros(m,m);
    Ufull(:,1:r) = Uthin;
    k = r;
    for j = 1:m
        if k == m
            break
        end
        e = zeros(m,1);
        e(j) = 1;
        for i = 1:k
            e = e - (Ufull(:,i)' * e) * Ufull(:,i);
        end
        nrm = norm(e);
        if nrm > tol
            k = k + 1;
            Ufull(:,k) = e / nrm;
        end
    end

    U = Ufull;
    S = zeros(m,n);
    S(1:r,1:r) = diag(s);

    Vfull = eye(n);
    Vfull(:,1:r) = V;
    V = Vfull;
end
