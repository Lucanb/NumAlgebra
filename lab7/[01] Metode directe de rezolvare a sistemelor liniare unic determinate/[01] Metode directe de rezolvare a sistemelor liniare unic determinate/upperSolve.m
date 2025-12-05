function [b]=upperSolve(U,b)
  n = matSquare(U);
  for j = n:-1:2,
   b(j)=b(j)/U(j,j);
   b(1:j-1)=b(1:j-1)-b(j)*U(1:j-1,j);
  end;
  b(1) = b(1)/U(1,1);
end
