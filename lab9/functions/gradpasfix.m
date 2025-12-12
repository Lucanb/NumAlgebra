function x = gradpasfix(A, b, c, x0, t, tol)

    x = x0;
    d = -2*A*x + 2*b;
    k = 0;
    while sqrt(d' * d) >= tol
        x = x + t * d;
        d = -2*A*x + 2*b;
        k++;
    end
    display(k);
    display(x);
end

