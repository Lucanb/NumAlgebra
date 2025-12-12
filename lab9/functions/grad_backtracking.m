function [x, X, T] = grad_backtracking(A, b, c, x0, tol)

    alpha = 0.25;
    beta  = 0.5;
    t0    = 1;

    f = @(x) x'*A*x + 2*b'*x + c;

    x = x0;
    g = 2*A*x + 2*b;
    d = -g;

    X = x;
    T = [];

    while sqrt(d' * d) >= tol
        t = t0;
        while f(x + t*d) > f(x) + alpha*t*(g'*d)
            t = beta * t;
        end

        x = x + t*d;
        X = [X x];
        T = [T t];

        g = 2*A*x + 2*b;
        d = -g;
    end

end

