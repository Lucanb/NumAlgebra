function x = LS_QR(A, b)
% LS_QR  Rezolva min ||A*x - b||_2 prin QR Householder:
%        A = Q*R, apoi R*x = Q'*b.

    if nargin ~= 2
        error('LS_QR:NumarArgumente', 'Se cer A si b.');
    end

    if ~isnumeric(A) || ~ismatrix(A)
        error('LS_QR:TipInvalidA', 'A trebuie sa fie matrice numerica.');
    end

    if ~isnumeric(b) || ~isvector(b)
        error('LS_QR:TipInvalidB', 'b trebuie sa fie vector numeric.');
    end

    [m,n] = size(A);
    b = b(:);
    if length(b) ~= m
        error('LS_QR:Compatibilitate', 'Dimensiuni incompatibile A si b.');
    end

    if any(~isfinite(A(:))) || any(~isfinite(b(:)))
        error('LS_QR:ValoriInvalid', 'A sau b contin NaN/Inf.');
    end

    [Q,R] = QRHouseholder(A);

    rhs = Q.' * b;
    x = SolveUpper(R, rhs);
end

