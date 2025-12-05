function [A, b] = GEM(A, b)
  n = matSquare(A);
  if length(b) ~= n
    error("Dimensiunile nu se protrivesc.")
  end
  if det(A) == 0
    error("Matricea este singulara.")
  end
  m = zeros(n);
  for i = 1:n-1
    m(i+1:n, i) = A(i+1:n, i)/A(i, i);
    A(i+1:n, :) = A(i+1:n, :) - m(i+1:n, i)*A(i, :);
    b(i+1:n) = b(i+1:n) - m(i+1:n, i)*b(i);
  end
end
