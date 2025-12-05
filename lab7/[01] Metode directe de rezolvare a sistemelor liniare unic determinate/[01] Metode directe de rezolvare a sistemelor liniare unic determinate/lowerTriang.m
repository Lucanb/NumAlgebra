function n = lowerTriang(L)
  n = matSquare(L);
  l = [];
  for (i = 1:n-1)
    l = [l L(i, i+1:n)];
  end
  if (any(l))
    error("Matricea nu este inferior triunghiulara.")
  end
end
