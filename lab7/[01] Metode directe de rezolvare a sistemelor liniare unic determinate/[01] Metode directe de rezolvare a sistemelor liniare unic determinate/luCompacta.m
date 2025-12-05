function [U, L] = luCompacta(A)
  [n, n] = size(A);
  U = zeros(n);
  L = eye(n);
  for k = 1:n
    for j = k:n
      s=0;
      for r=1:(k-1)
        s = s+L(k, r)*U(r, j);
      endfor
      U(k, j) = A(k, j) - s;
      for i = (k+1):n
        s=0;
        for r = 1:(k-1)
          s = s + L(i, r)*U(r, k);
        endfor
        L(i, k) = (A(i, k) - s)/U(k, k);
      endfor
    endfor
  endfor
end
