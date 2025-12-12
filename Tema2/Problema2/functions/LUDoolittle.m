function [L, U] = LUDoolittle(A)
    if nargin ~= 1
        error('LUDoolittle:NumarArgumente', 'Functia primeste exact un argument: A.');
    end

    if ~isnumeric(A) || ~ismatrix(A)
        error('LUDoolittle:TipInvalid', 'A trebuie sa fie o matrice numerica.');
    end

    [n, m] = size(A);
    if n ~= m
        error('LUDoolittle:Dimensiuni', 'A trebuie sa fie patratica.');
    end

    if any(~isfinite(A(:)))
        error('LUDoolittle:ValoriInvalid', 'A contine NaN sau Inf.');
    end

    L = eye(n);
    U = zeros(n);

    for k = 1:n
        for j = k:n
            s = 0;
            for p = 1:k-1
                s = s + L(k,p) * U(p,j);
            end
            U(k,j) = A(k,j) - s;
        end

        if U(k,k) == 0
            error('LUDoolittle:PivotZero', 'Pivot zero la k=%d. Fara pivotare nu se poate.', k);
        end

        for i = k+1:n
            s = 0;
            for p = 1:k-1
                s = s + L(i,p) * U(p,k);
            end
            L(i,k) = (A(i,k) - s) / U(k,k);
        end
    end
end

