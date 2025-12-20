function [L, U] = LUBlocuriRecursivDoolittle(A)
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

    k = floor(n/2); %ok pai impart in 4 zone si A11, A22 - matrici aptratice clar 
                    % deci putem aplica aceeasi functie pt ele pana la un
                    % caz de baza.

    A11 = A(1:k,   1:k);
    A12 = A(1:k,   k+1:n);
    A21 = A(k+1:n, 1:k);
    A22 = A(k+1:n, k+1:n);


    [L11, U11] = LUBlocuriRecursivDoolittle(A11); %matricea e patratica deci pot aplica recursiv functia pana la un caz de baza

    U12 = SolveLowerRec_(L11, A12, true);
                                      %aici ca si la a 21 nu mai am matrici aptratice deci incerc sa rezolv 2 sisteme U12 = inv(L11) * A12,  L21 = A21 * inv(U11)

    L21 = SolveRightUpper_(U11, A21);

    S = A22 - L21 * U12;

    [L22, U22] = LUBlocuriRecursivDoolittle(S); %analog aplic si aici functia pana la u caz de baza

    L = [L11,              zeros(k, n-k);   %ok stiu blocuriile pt L si U deci dupa apelul recursiv reconstruiesc L respectiv U
         L21,              L22];

    U = [U11,              U12;
         zeros(n-k, k),    U22];
end
