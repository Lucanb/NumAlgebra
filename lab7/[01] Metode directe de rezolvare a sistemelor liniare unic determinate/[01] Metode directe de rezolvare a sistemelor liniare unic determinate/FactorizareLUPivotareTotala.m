function [L, U, P, Q] = FactorizareLUPivotareTotala(A)
  n = matSquare(A);
  P = eye(n);
  Q = eye(n);
  m = zeros(n);
  for i = 1:n-1
    [Max, indiceMax] = max(abs(A(i:n, i:n)));
    [MaxTotal, indiceMaxTotal] = max(Max);
    coloana = indiceMaxTotal;
    linie = indiceMax(coloana);
    if (linie ~= 1) % conditia asta este echivalenta cu m + i - 1 ~= i sau cu A(m + i - 1, :) ~= A(i, :)
      A = PermutareLinii(A, i, i+linie-1);
      m = PermutareLinii(m, i, i+linie-1);
      P = PermutareLinii(P, i, i+linie-1);
    end
    if (coloana ~= 1) % conditia asta este echivalenta cu m + i - 1 ~= i sau cu A(m + i - 1, :) ~= A(i, :)
      A = PermutareColoane(A, i, i+coloana-1);
      m = PermutareColoane(m, i, i+coloana-1);
      Q = PermutareColoane(Q, i, i+coloana-1);
    end
    m(i+1:n, i) = A(i+1:n, i)/A(i, i);
    A(i+1:n, :) = A(i+1:n, :) - m(i+1:n, i)*A(i, :);
  end
  L = eye(n)+m;
  U = A;
end
