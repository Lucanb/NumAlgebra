function [A] = PermutareColoaneProd(A, i, j)
  [n, n] = size(A);
  B = eye(n);
  B(i, i) = 0;
  B(j, j) = 0;
  B(i, j) = 1;
  B(j, i) = 1;
  A = A*B;
end
