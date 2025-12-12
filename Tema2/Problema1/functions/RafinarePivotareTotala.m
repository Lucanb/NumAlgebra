function x = RafinarePivotareTotala(A, b, tol)
% RafinarePivotareTotala  Rafinare iterativa folosind LU cu pivotare totala.
% Foloseste PAQ = LU, apoi:
%   r = b - A*x
%   A*delta = r
%   x = x + delta
% Stop: ||r||/||b|| < tol sau maxIter

    if nargin ~= 3
        error('RafinarePivotareTotala:NumarArgumente', 'Se cer exact 3 argumente: A, b, tol.');
    end

    if ~isnumeric(A) || ~ismatrix(A)
        error('RafinarePivotareTotala:TipInvalidA', 'A trebuie sa fie matrice numerica.');
    end

    [n, m] = size(A);
    if n ~= m
        error('RafinarePivotareTotala:DimensiuniA', 'A trebuie sa fie patratica.');
    end

    if ~isnumeric(b) || ~isvector(b)
        error('RafinarePivotareTotala:TipInvalidB', 'b trebuie sa fie vector numeric.');
    end
    b = b(:);

    if length(b) ~= n
        error('RafinarePivotareTotala:Compatibilitate', 'length(b) trebuie sa fie n.');
    end

    if ~isnumeric(tol) || ~isscalar(tol) || tol <= 0
        error('RafinarePivotareTotala:TolInvalid', 'tol trebuie sa fie scalar pozitiv.');
    end

    if any(~isfinite(A(:))) || any(~isfinite(b(:)))
        error('RafinarePivotareTotala:ValoriInvalid', 'A sau b contin NaN/Inf.');
    end

    [P, Q, L, U] = LUPivotareTotala(A);

    x = SolveWithLUtot_(P, Q, L, U, b);

    nb = sqrt(sum(b.*b));
    if nb == 0
        x = zeros(n,1);
        return;
    end

    maxIter = 50;

    for it = 1:maxIter
        r = b - A*x;

        if sqrt(sum(r.*r)) / nb < tol
            break;
        end

        delta = SolveWithLUtot_(P, Q, L, U, r);
        x = x + delta;

        if sqrt(sum(delta.*delta)) / max(1, sqrt(sum(x.*x))) < tol
            break;
        end
    end
end


function x = SolveWithLUtot_(P, Q, L, U, b)
% Rezolva A*x=b cand avem PAQ=LU:
% L*y = P*b
% U*z = y
% x = Q*z

    rhs = P*b;
    n = length(rhs);

    % forward substitution (L unit inferior triunghiulara)
    y = zeros(n,1);
    for i = 1:n
        s = 0;
        for j = 1:i-1
            s = s + L(i,j) * y(j);
        end
        y(i) = rhs(i) - s;
    end

    % backward substitution (U superior triunghiulara)
    z = zeros(n,1);
    for i = n:-1:1
        s = 0;
        for j = i+1:n
            s = s + U(i,j) * z(j);
        end
        if U(i,i) == 0
            error('RafinarePivotareTotala:PivotZeroU', 'U(%d,%d)=0, sistem nedeterminat / singular.', i, i);
        end
        z(i) = (y(i) - s) / U(i,i);
    end

    x = Q * z;
end

