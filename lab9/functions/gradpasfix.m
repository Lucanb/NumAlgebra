function [x, X] = gradpasfix(A, b, c, x0, t, tol)

    x = x0;
    d = -2*A*x - 2*b;

    X = x;

    while sqrt(d' * d) >= tol
        x = x + t * d;
        X = [X x];
        d = -2*A*x - 2*b;
    end

end

