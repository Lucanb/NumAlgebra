function [U, L] = luCompacta1(A)
  [n, n] = size(A);
  U = zeros(n);
  L = eye(n);
  for k = 1:n
    for i = k:n
      s=0;
      for r=1:(k-1)
        s = s+L(k, r)*U(r, i);
      endfor
      U(k, i) = A(k, i) - s;
      s=0;
      for r = 1:(k-1)
        s = s + L(i, r)*U(r, k);
      endfor
      L(i, k) = (A(i, k) - s)/U(k, k);
    endfor
  endfor
end
