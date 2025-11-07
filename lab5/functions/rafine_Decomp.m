function [x, errors, iter] = rafine_Decomp(A, b, tol, max_iter)
if nargin < 3
    tol = 1e-8;
end
if nargin < 4
    max_iter = 5;
end

[L, U] = factLU(A);
y = forward(L, b);
x = backward(U, y);

errors = zeros(max_iter, 1);

for k = 1:max_iter
    r = b - A*x;
    errors(k) = norm(r);

    if errors(k) < tol
        iter = k;
        errors = errors(1:k);
        return
    end

    y = forward(L, r);
    d = backward(U, y);
    x = x + d;
end

iter = max_iter;
end
