function f = tridiagonal(A)
    [i,j,~] = find(A);
    f = all(abs(i - j) <= 1);
end