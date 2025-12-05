function A = PermutareColoane(A, i, j)
  n = matSquare(A);
  aux = A(:, i);
  A(:, i) = A(:, j);
  A(:, j) = aux;
end
