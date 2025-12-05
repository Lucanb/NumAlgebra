function A = PermutareLinii(A, i, j)
  [n, m] = size(A);
  aux = A(i, :);
  A(i, :) = A(j, :);
  A(j, :) = aux;
end
