function [L, U] = LUBlocuriRecursiv(A)
% LUBlocuriRecursiv  Factorizare LU recursiva pe blocuri (fara pivotare):
%                    A = L*U, unde L este inferior triunghiulara (diag=1)
%                    si U este superior triunghiulara.
%
% Observatie: Fara pivotare, algoritmul necesita pivoti nenuli pe parcurs
%             (altfel se opreste cu eroare).

    if nargin ~= 1
        error('LUBlocuriRecursiv:NumarArgumente', 'Functia primeste exact un argument: A.');
    end

    if ~isnumeric(A) || ~ismatrix(A)
        error('LUBlocuriRecursiv:TipInvalid', 'A trebuie sa fie o matrice numerica.');
    end

    [n, m] = size(A);
    if n ~= m
        error('LUBlocuriRecursiv:Dimensiuni', 'A trebuie sa fie patratica (n x n).');
    end

    if any(~isfinite(A(:)))
        error('LUBlocuriRecursiv:ValoriInvalid', 'A contine NaN sau Inf.');
    end

    if n == 0
        L = [];
        U = [];
        return;
    end

    if n == 1
        if A(1,1) == 0
            error('LUBlocuriRecursiv:PivotZero', 'Pivot zero la n=1. Nu se poate fara pivotare.');
        end
        L = 1;
        U = A(1,1);
        return;
    end

    if n <= 3
        [L, U] = LUBaseDoolittle_(A);
        return;
    end

    k = floor(n/2);

    A11 = A(1:k,     1:k);
    A12 = A(1:k,     k+1:n);
    A21 = A(k+1:n,   1:k);
    A22 = A(k+1:n,   k+1:n);

    [L11, U11] = LUBlocuriRecursiv(A11);

    U12 = SolveLower_(L11, A12, true);

    L21 = SolveRightUpper_(U11, A21);

    S = A22 - L21 * U12;

    [L22, U22] = LUBlocuriRecursiv(S);

    L = [L11,              zeros(k, n-k);
         L21,              L22];

    U = [U11,              U12;
         zeros(n-k, k),    U22];
end
