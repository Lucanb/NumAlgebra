function X = SolveLower_(L, B, unitDiag)
% SolveLower_  Rezolva L*X = B prin substitutie directa.
% unitDiag = true  -> diag(L)=1
% unitDiag = false -> diag(L) generala

    [n, n2] = size(L);
    if n ~= n2
        error('LUBlocuriRecursiv:LowerNotSquare', 'Matricea L trebuie sa fie patratica.');
    end

    [nb, p] = size(B);
    if nb ~= n
        error('LUBlocuriRecursiv:DimIncompat', 'Dimensiuni incompatibile in SolveLower_.');
    end

    X = zeros(n, p);

    for j = 1:p
        for i = 1:n
            s = 0;
            for t = 1:i-1
                s = s + L(i,t) * X(t,j);
            end
            rhs = B(i,j) - s;

            if unitDiag
                X(i,j) = rhs;
            else
                if L(i,i) == 0
                    error('LUBlocuriRecursiv:ZeroDiagLower', 'L(%d,%d)=0 in SolveLower_.', i, i);
                end
                X(i,j) = rhs / L(i,i);
            end
        end
    end
end
