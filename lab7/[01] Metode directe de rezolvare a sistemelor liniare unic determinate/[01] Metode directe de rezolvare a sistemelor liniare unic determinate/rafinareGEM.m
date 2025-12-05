function x = rafinareGEM(A, b, tol)
  x = rezolvareSistem(A, b);
  r = b - A*x;
  z = rezolvareSistem(A, r);
  x = x + z;
  k=1;
  while (norm(z)/norm(x) >= tol && k < 10^6)
    r = b - A*x;
    z = rezolvareSistem(A, r);
    x = x + z;
    k = k+1;
  end
end
