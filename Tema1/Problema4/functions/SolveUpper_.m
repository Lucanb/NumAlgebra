function X = SolveUpper_(U, B)
% SolveUpper_  Rezolva U*X = B prin substitutie inversa (U superior triunghiulara).

    [n, n2] = size(U);
    if n ~= n2
        error('LUBlocuriRecursiv:UpperNotSquare', 'Matricea U trebuie sa fie patratica.');
    end

    [nb, p] = size(B);
    if nb ~= n
        error('LUBlocuriRecursiv:DimIncompat', 'Dimensiuni incompatibile in SolveUpper_.');
    end

    X = zeros(n, p);

    for j = 1:p
        for i = n:-1:1
            s = 0;
            for t = i+1:n
                s = s + U(i,t) * X(t,j);
            end
            if U(i,i) == 0
                error('LUBlocuriRecursiv:ZeroDiagUpper', 'U(%d,%d)=0 in SolveUpper_.', i, i);
            end
            X(i,j) = (B(i,j) - s) / U(i,i);
        end
    end
end


