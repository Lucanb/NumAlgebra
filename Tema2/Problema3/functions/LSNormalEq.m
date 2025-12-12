function x = LSNormalEq(A, b)
% LSNormalEq  Rezolva problema LS min ||A*x - b||_2 prin ecuatii normale:
%             (A'*A) x = A'*b
% Restrictii: fara operatorul "\" in functie; folosim LU Doolittle + substitutii.

    if nargin ~= 2
        error('LSNormalEq:NumarArgumente', 'Se cer A si b.');
    end

    if ~isnumeric(A) || ~ismatrix(A)
        error('LSNormalEq:TipInvalidA', 'A trebuie sa fie matrice numerica.');
    end

    if ~isnumeric(b) || ~isvector(b)
        error('LSNormalEq:TipInvalidB', 'b trebuie sa fie vector numeric.');
    end

    [m,n] = size(A);
    b = b(:);
    if length(b) ~= m
        error('LSNormalEq:Compatibilitate', 'Dimensiuni incompatibile A si b.');
    end

    if any(~isfinite(A(:))) || any(~isfinite(b(:)))
        error('LSNormalEq:ValoriInvalid', 'A sau b contin NaN/Inf.');
    end

    G = A.' * A;
    d = A.' * b;

    [L,U] = LUDoolittle(G);
    x = SolveLU_Doolittle(L,U,d);
end

