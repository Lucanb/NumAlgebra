function X = SolveLowerRec_(L, B, unitDiag)
    [n, n2] = size(L);
    if n ~= n2
        error('SolveLowerRec_:LowerNotSquare', 'L trebuie sa fie patratica.');
    end

    [nb, p] = size(B);
    if nb ~= n
        error('SolveLowerRec_:DimIncompat', 'Dimensiuni incompatibile: L si B.');
    end

    if n == 0
        X = zeros(0, p);
        return;
    end

    % Caz de baza: dimensiune mica -> folosesc varianta iterativa
    if n <= 3
        X = SolveLower_(L, B, unitDiag);
        return;
    end

    k = floor(n/2);

    L11 = L(1:k,   1:k);
    L21 = L(k+1:n, 1:k);
    L22 = L(k+1:n, k+1:n);

    B1  = B(1:k,   :);
    B2  = B(k+1:n, :);

    X1 = SolveLowerRec_(L11, B1, unitDiag);
    R  = B2 - L21 * X1;
    X2 = SolveLowerRec_(L22, R, unitDiag);

    X = [X1; X2];
end
