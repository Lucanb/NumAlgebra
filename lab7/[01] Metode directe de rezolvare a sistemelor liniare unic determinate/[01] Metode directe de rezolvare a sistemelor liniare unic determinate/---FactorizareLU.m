function [L, U] = FactorizareLU(A)
  n = matSquare(A);
  m = zeros(n);
  for k=1:(n-1)
    for i=(k+1):n
      m(i,k) = A(i, k)/A(k,k);
      for j=(k):n
        A(i, j) = A(i, j) - m(i, k)*A(k,j);
      endfor
    endfor
  endfor
  L = eye(n) + m;
  U = A;
end
