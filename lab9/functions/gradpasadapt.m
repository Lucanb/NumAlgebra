function [x, X, T] = gradpasadapt(A, b, c, x0, tol)

    x = x0;
    d = -2*A*x - 2*b;

    X = x;
    T = [];

    while sqrt(d' * d) >= tol
        tk = (d' * d) / (2 * (d' * A * d));
        x = x + tk * d;
        X = [X x];
        T = [T tk];
        d = -2*A*x - 2*b;
    end

end

