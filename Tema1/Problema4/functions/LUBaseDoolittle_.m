function [L, U] = LUBaseDoolittle_(A)
% LUBaseDoolittle_  Doolittle (fara pivotare) pentru dimensiuni mici.
    [n, ~] = size(A);
    L = eye(n);
    U = zeros(n);

    for kk = 1:n
        for j = kk:n
            s = 0;
            for p = 1:kk-1
                s = s + L(kk,p) * U(p,j);
            end
            U(kk,j) = A(kk,j) - s;
        end

        if U(kk,kk) == 0
            error('LUBlocuriRecursiv:PivotZero', ...
                  'Pivot zero in baza Doolittle la k=%d. Nu se poate fara pivotare.', kk);
        end

        for i = kk+1:n
            s = 0;
            for p = 1:kk-1
                s = s + L(i,p) * U(p,kk);
            end
            L(i,kk) = (A(i,kk) - s) / U(kk,kk);
        end
    end
end

