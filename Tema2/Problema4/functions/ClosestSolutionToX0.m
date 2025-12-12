function x = ClosestSolutionToX0(A, b, x0)
% ClosestSolutionToX0  Gaseste solutia care minimizeaza ||x-x0||_2 cu restrictia Ax=b:
% (A*A')*lambda = A*x0 - b
% x = x0 - A'*lambda

    if nargin ~= 3
        error('ClosestSolutionToX0:NumarArgumente', 'Se cer A, b, x0.');
    end

    if ~isnumeric(A) || ~ismatrix(A)
        error('ClosestSolutionToX0:TipInvalidA', 'A trebuie sa fie matrice numerica.');
    end

    if ~isnumeric(b) || ~isvector(b)
        error('ClosestSolutionToX0:TipInvalidB', 'b trebuie sa fie vector numeric.');
    end

    if ~isnumeric(x0) || ~isvector(x0)
        error('ClosestSolutionToX0:TipInvalidX0', 'x0 trebuie sa fie vector numeric.');
    end

    [m,n] = size(A);
    b = b(:);
    x0 = x0(:);

    if length(b) ~= m
        error('ClosestSolutionToX0:Compatibilitate', 'length(b) trebuie sa fie m.');
    end

    if length(x0) ~= n
        error('ClosestSolutionToX0:Compatibilitate', 'length(x0) trebuie sa fie n.');
    end

    if any(~isfinite(A(:))) || any(~isfinite(b(:))) || any(~isfinite(x0(:)))
        error('ClosestSolutionToX0:ValoriInvalid', 'A, b sau x0 contin NaN/Inf.');
    end

    M = A*A.';          % matrice 2x2
    rhs = A*x0 - b;     % vector 2x1

    [L,U] = LUDoolittle(M);
    lambda = SolveLU_Doolittle(L,U,rhs);

    x = x0 - A.'*lambda;
end

