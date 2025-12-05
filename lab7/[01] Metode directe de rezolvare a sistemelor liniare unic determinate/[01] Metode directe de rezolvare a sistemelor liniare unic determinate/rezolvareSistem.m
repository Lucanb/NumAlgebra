function x = rezolvareSistem(A, b)
  [L U P Q] = FactorizareLUPivotareTotala(A);
  y = lowerSolve(L, P*b);
  z = upperSolve(U, y);
  x = Q*z;
end
