function [L, D, M] = FactorizareLDM (A)
  n = matSquare(A);
  [L, U] = FactorizareLU(A);
  D = diag(diag(U));
  inversaD = zeros(n);
  for(i = 1:n)
    inversaD(i, i) = 1 / D(i, i);
  end
  M = inversaD*U;
end
