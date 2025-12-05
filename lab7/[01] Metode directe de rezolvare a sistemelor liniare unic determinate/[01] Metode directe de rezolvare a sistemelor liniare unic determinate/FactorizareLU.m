function [L, U] = FactorizareLU(A)
  n = matSquare(A);
  if det(A) == 0
    error("Matricea este singulara.")
  end
  m = eye(n);
  for i = 1:n-1
    m(i+1:n, i) = A(i+1:n, i)/A(i, i);
    A(i+1:n, :) = A(i+1:n, :) - m(i+1:n, i)*A(i, :);
  end
  L = m;
  U = A;
end
