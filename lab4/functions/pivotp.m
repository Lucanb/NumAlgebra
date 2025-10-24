function [P, L, U] = pivotp(A)
[m, n] = size(A);
if m ~= n
    error('Matricea trebuie sa fie patratica')
end
if n == 1
    P = 1;
    L = 1;
    U = A;
    return
end
[~, pivot] = max(abs(A(:,1)));
P = eye(n);
if pivot ~= 1
    P([1 pivot], :) = P([pivot 1], :);
end
A = P * A;
U = A;
L = eye(n);
if abs(U(1,1)) < eps
    error('Pivot nul')
end
L(2:end,1) = U(2:end,1) / U(1,1);
U(2:end,:) = U(2:end,:) - L(2:end,1) * U(1,:);
[P1, L1, U1] = pivotp(U(2:end,2:end));
Psmall = eye(n);
Psmall(2:end,2:end) = P1;
P = Psmall * P;
L(2:end,2:end) = L1;
U(2:end,2:end) = U1;
end
