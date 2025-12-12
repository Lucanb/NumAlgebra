function [P, Q, L, U] = LUPivotareTotala(A)
% LUPivotareTotala  Calculeaza descompunerea cu pivotare totala:
%                   P * A * Q = L * U
% unde P si Q sunt matrice de permutare, L este inferior triunghiulara (diag=1),
% iar U este superior triunghiulara.
%
% Input:
%   A - matrice patratica (n x n)
%
% Output:
%   P, Q - matrici de permutare (n x n)
%   L    - matrice inferior triunghiulara cu 1 pe diagonala
%   U    - matrice superior triunghiulara

    if nargin ~= 1
        error('LUPivotareTotala:NumarArgumente', 'Functia primeste exact un argument: A.');
    end

    if ~isnumeric(A) || ~ismatrix(A)
        error('LUPivotareTotala:TipInvalid', 'A trebuie sa fie o matrice numerica.');
    end

    [n, m] = size(A);
    if n ~= m
        error('LUPivotareTotala:Dimensiuni', 'A trebuie sa fie patratica (n x n).');
    end

    if any(~isfinite(A(:)))
        error('LUPivotareTotala:ValoriInvalid', 'A contine valori NaN sau Inf.');
    end

    U = A;
    L = eye(n);
    P = eye(n);
    Q = eye(n);

    for k = 1:n-1
        maxVal = 0;
        p = k;
        q = k;

        for i = k:n
            for j = k:n
                val = abs(U(i, j));
                if val > maxVal
                    maxVal = val;
                    p = i;
                    q = j;
                end
            end
        end

        if maxVal == 0
            error('LUPivotareTotala:Singular', ...
                  'Matrice singulara: pivot nul la pasul k=%d (submatricea ramasa este zero).', k);
        end

        if p ~= k
            tmp = U(k, :); U(k, :) = U(p, :); U(p, :) = tmp;

            tmp = P(k, :); P(k, :) = P(p, :); P(p, :) = tmp;

            if k > 1
                tmp = L(k, 1:k-1);
                L(k, 1:k-1) = L(p, 1:k-1);
                L(p, 1:k-1) = tmp;
            end
        end

        if q ~= k
            tmp = U(:, k); U(:, k) = U(:, q); U(:, q) = tmp;

            tmp = Q(:, k); Q(:, k) = Q(:, q); Q(:, q) = tmp;
        end

        pivot = U(k, k);
        if pivot == 0
            error('LUPivotareTotala:PivotZero', ...
                  'Pivot zero dupa permutari la pasul k=%d. Matricea poate fi singulara.', k);
        end

        for i = k+1:n
            L(i, k) = U(i, k) / pivot;
            U(i, k:n) = U(i, k:n) - L(i, k) * U(k, k:n);
            U(i, k) = 0;
        end
    end

    if U(n, n) == 0
        error('LUPivotareTotala:SingularFinal', ...
              'Matrice singulara: U(%d,%d)=0 la final.', n, n);
    end
end

