function [L, U] = LUDoolittle(A)
% LUDoolittle  Factorizare LU prin metoda Doolittle (fara pivotare):
%              A = L * U, cu L inferior triunghiular (diag=1) si U superior triunghiular.

    if nargin ~= 1
        error('LUDoolittle:NumarArgumente', 'Functia primeste exact un argument: A.');
    end

    if ~isnumeric(A) || ~ismatrix(A)
        error('LUDoolittle:TipInvalid', 'A trebuie sa fie o matrice numerica.');
    end

    [n, m] = size(A);
    if n ~= m
        error('LUDoolittle:Dimensiuni', 'A trebuie sa fie patratica (n x n).');
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
                s = s + L(k, p) * U(p, j);
            end
            U(k, j) = A(k, j) - s;
        end

        if U(k, k) == 0
            error('LUDoolittle:PivotZero', ...
                  'Pivot zero la pasul k=%d. Metoda Doolittle fara pivotare nu se poate aplica.', k);
        end

        for i = k+1:n
            s = 0;
            for p = 1:k-1
                s = s + L(i, p) * U(p, k);
            end
            L(i, k) = (A(i, k) - s) / U(k, k);
        end
    end
end

