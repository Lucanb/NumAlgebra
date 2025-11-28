function f = check_rank(A,n)
    mrank = rank(A);
    f = (mrank == n);
end