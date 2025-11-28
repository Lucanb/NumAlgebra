function [best_coeff, best_err, best_deg] = lsc_poly(M, max_deg, tol, max_iter)

x = M(:,1);
b = M(:,2);
m = length(x);

best_err = Inf;
best_coeff = [];
best_deg = 0;

for deg = 1:max_deg
    A = zeros(m, deg+1);
    for i = 0:deg
        A(:,i+1) = x.^i;
    end
    
    if rank(A) < deg+1
        continue
    end
    
    coeff = zeros(deg+1,1);
    err = Inf;
    iter = 0;
    
    while err > tol && iter < max_iter
        AtA = A' * A;
        Atb = A' * b;
        if rcond(AtA) < 1e-12
            AtA = AtA + 1e-8 * eye(size(AtA));
        end
        coeff = inv(AtA) * Atb;
        err = norm(A*coeff - b) / norm(b);
        iter = iter + 1;
    end
    
    if err < best_err
        best_err = err;
        best_coeff = coeff;
        best_deg = deg;
    end
    
    if best_err < tol
        fprintf('Gradul: %d\n', deg);
        break
    end
end

if isempty(best_coeff)
    warning('Nu s-a gasit polinom care sa satisfaca toleranta');
end

end
