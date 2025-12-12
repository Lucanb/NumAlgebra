function x = Refine_QR(A, b, tol)
% Refine_QR  Rafinare iterativa pornind de la solutia QR:
% r = b - A*x, rezolvam A*delta = r (tot via QR), x <- x + delta.

    if nargin ~= 3
        error('Refine_QR:NumarArgumente', 'Se cer A, b, tol.');
    end

    x = LS_QR(A,b);

    nb = sqrt(sum(b(:).*b(:)));
    if nb == 0
        x = zeros(size(A,2),1);
        return;
    end

    maxIter = 50;
    [Q,R] = QRHouseholder(A);

    for it = 1:maxIter
        r = b - A*x;
        if sqrt(sum(r.*r)) / nb < tol
            break;
        end
        delta = SolveUpper(R, Q.'*r);
        x = x + delta;

        if sqrt(sum(delta.*delta)) / max(1,sqrt(sum(x.*x))) < tol
            break;
        end
    end
end

