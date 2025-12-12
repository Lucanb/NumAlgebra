function [Q, R] = QRHouseholder(A)
% QRHouseholder  Factorizare QR cu reflectori Householder (fara qr()).
% Returneaza Q ortogonala si R superior triunghiulara astfel incat A = Q*R.

    if nargin ~= 1
        error('QRHouseholder:NumarArgumente', 'Se cere exact un argument: A.');
    end

    if ~isnumeric(A) || ~ismatrix(A)
        error('QRHouseholder:TipInvalid', 'A trebuie sa fie matrice numerica.');
    end

    [m, n] = size(A);
    if m ~= n
        error('QRHouseholder:Dimensiuni', 'Pentru aceasta tema presupunem A patratica.');
    end

    if any(~isfinite(A(:)))
        error('QRHouseholder:ValoriInvalid', 'A contine NaN/Inf.');
    end

    R = A;
    Q = eye(n);

    for k = 1:n-1
        x = R(k:n, k);

        nx = sqrt(sum(x .* x));
        if nx == 0
            continue;
        end

        alpha = nx;
        if x(1) >= 0
            alpha = -alpha;
        end

        v = x;
        v(1) = v(1) - alpha;

        nv = sqrt(sum(v .* v));
        if nv == 0
            continue;
        end
        v = v / nv;

        Hk = eye(n);
        Hsmall = eye(n-k+1) - 2 * (v * v.');
        Hk(k:n, k:n) = Hsmall;

        R = Hk * R;
        Q = Q * Hk.';
    end
end
