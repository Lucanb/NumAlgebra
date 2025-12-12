function [L, U] = LUDoolittle(A)
% LUDoolittle  Factorizare LU prin Doolittle: A = L*U, diag(L)=1.

    if nargin ~= 1
        error('LUDoolittle:NumarArgumente', 'Se cere A.');
    end

    if ~isnumeric(A) || ~ismatrix(A)
        error('LUDoolittle:TipInvalid', 'A trebuie sa fie matrice numerica.');
    end

    [n,m] = size(A);
    if n ~= m
        error('LUDoolittle:Dimensiuni', 'A trebuie sa fie patratica.');
    end

    if any(~isfinite(A(:)))
        error('LUDoolittle:ValoriInvalid', 'A contine NaN/Inf.');
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
            error('LUDoolittle:PivotZero', 'Pivot zero la k=%d.', k);
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

