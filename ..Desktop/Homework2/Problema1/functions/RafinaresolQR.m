function x = RafinaresolQR(A, b, tol)
% RafinaresolQR  Rafinare iterativa folosind QR (Householder).
% A = Q*R, rezolva initial R*x = Q'*b, apoi rafineaza:
%   r = b - A*x
%   A*delta = r  (tot via QR)
%   x = x + delta

    if nargin ~= 3
        error('RafinaresolQR:NumarArgumente', 'Se cer exact 3 argumente: A, b, tol.');
    end

    if ~isnumeric(A) || ~ismatrix(A)
        error('RafinaresolQR:TipInvalidA', 'A trebuie sa fie matrice numerica.');
    end

    [n, m] = size(A);
    if n ~= m
        error('RafinaresolQR:DimensiuniA', 'A trebuie sa fie patratica.');
    end

    if ~isnumeric(b) || ~isvector(b)
        error('RafinaresolQR:TipInvalidB', 'b trebuie sa fie vector numeric.');
    end

    b = b(:);
    if length(b) ~= n
        error('RafinaresolQR:Compatibilitate', 'length(b) trebuie sa fie n.');
    end

    if ~isnumeric(tol) || ~isscalar(tol) || tol <= 0
        error('RafinaresolQR:TolInvalid', 'tol trebuie sa fie scalar pozitiv.');
    end

    if any(~isfinite(A(:))) || any(~isfinite(b(:)))
        error('RafinaresolQR:ValoriInvalid', 'A sau b contin NaN/Inf.');
    end

    [Q, R] = QRHouseholder(A);

    x = SolveWithQR_(Q, R, b);

    nb = Norm2_(b);
    if nb == 0
        x = zeros(n, 1);
        return;
    end

    maxIter = 50;

    for it = 1:maxIter
        r = b - A * x;

        if Norm2_(r) / nb < tol
            break;
        end

        delta = SolveWithQR_(Q, R, r);

        x = x + delta;

        if Norm2_(delta) / max(1, Norm2_(x)) < tol
            break;
        end
    end
end
