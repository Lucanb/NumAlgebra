function [L, U, P] = FactorizareLUPivotarePartiala(A)
  n = matSquare(A);
  P = eye(n);
  m = zeros(n);
  for i = 1:n-1
    [Max, indiceMax] = max(abs(A(i:n, i)));
    if (indiceMax ~= 1) % conditia asta este echivalenta cu m + i - 1 ~= i sau cu A(m + i - 1, :) ~= A(i, :)
      A = PermutareLinii(A, i, i+indiceMax-1);
      m = PermutareLinii(m, i, i+indiceMax-1);
      P = PermutareLinii(P, i, i+indiceMax-1);
    end
    m(i+1:n, i) = A(i+1:n, i)/A(i, i);
    A(i+1:n, :) = A(i+1:n, :) - m(i+1:n, i)*A(i, :);
  end
  L = eye(n)+m;
  U = A;
end
