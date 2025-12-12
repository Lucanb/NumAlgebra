function x = SolveUpper(U, b)
% SolveUpper  Rezolva U*x = b prin substitutie inversa.
% U trebuie sa fie superior triunghiulara.

    if nargin ~= 2
        error('SolveUpper:NumarArgumente', 'Se cer U si b.');
    end

    if ~isnumeric(U) || ~ismatrix(U)
        error('SolveUpper:TipInvalidU', 'U trebuie sa fie matrice numerica.');
    end

    if ~isnumeric(b) || ~isvector(b)
        error('SolveUpper:TipInvalidB', 'b trebuie sa fie vector numeric.');
    end

    [n,m] = size(U);
    if n ~= m
        error('SolveUpper:Dimensiuni', 'U trebuie sa fie patratica.');
    end

    b = b(:);
    if length(b) ~= n
        error('SolveUpper:Compatibilitate', 'Dimensiuni incompatibile U si b.');
    end

    if any(~isfinite(U(:))) || any(~isfinite(b(:)))
        error('SolveUpper:ValoriInvalid', 'U sau b contin NaN/Inf.');
    end

    x = zeros(n,1);

    for i = n:-1:1
        s = 0;
        for j = i+1:n
            s = s + U(i,j) * x(j);
        end

        if U(i,i) == 0
            error('SolveUpper:PivotZero', 'U(%d,%d)=0.', i, i);
        end

        x(i) = (b(i) - s) / U(i,i);
    end
end

