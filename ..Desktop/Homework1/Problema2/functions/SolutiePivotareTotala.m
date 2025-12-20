function x = SolutiePivotareTotala(A, b)
% SolutiePivotareTotala  Rezolva sistemul A*x = b folosind LU cu pivotare totala.
% Se construieste PAQ = LU, apoi se rezolva:
%   L*y = P*b  (substitutie directa)
%   U*z = y    (substitutie inversa)
%   x = Q*z

    if nargin ~= 2
        error('SolutiePivotareTotala:NumarArgumente', 'Functia primeste exact doua argumente: A si b.');
    end

    if ~isnumeric(A) || ~ismatrix(A)
        error('SolutiePivotareTotala:TipInvalidA', 'A trebuie sa fie o matrice numerica.');
    end

    if ~isnumeric(b)
        error('SolutiePivotareTotala:TipInvalidB', 'b trebuie sa fie numeric.');
    end

    [n, m] = size(A);
    if n ~= m
        error('SolutiePivotareTotala:DimensiuniA', 'A trebuie sa fie patratica.');
    end

    if any(~isfinite(A(:))) || any(~isfinite(b(:)))
        error('SolutiePivotareTotala:ValoriInvalid', 'A sau b contin NaN/Inf.');
    end

    if ~(isvector(b))
        error('SolutiePivotareTotala:DimensiuniB', 'b trebuie sa fie vector.');
    end

    b = b(:);
    if length(b) ~= n
        error('SolutiePivotareTotala:Compatibilitate', 'Dimensiune incompatibila: length(b) trebuie sa fie n.');
    end

    [P, Q, L, U] = LUPivotareTotala(A);

    rhs = P * b;

    y = zeros(n, 1);
    for i = 1:n
        s = 0;
        for j = 1:i-1
            s = s + L(i, j) * y(j);
        end
        y(i) = rhs(i) - s;
    end

    z = zeros(n, 1);
    for i = n:-1:1
        s = 0;
        for j = i+1:n
            s = s + U(i, j) * z(j);
        end
        if U(i, i) == 0
            error('SolutiePivotareTotala:PivotZeroU', 'U(%d,%d)=0, sistemul nu are solutie unica.', i, i);
        end
        z(i) = (y(i) - s) / U(i, i);
    end

    x = Q * z;
end

