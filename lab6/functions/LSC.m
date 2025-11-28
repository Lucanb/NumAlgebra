function [x, err, rank_ok] = LSC(M, n)
A = M(:,1:n);
b = M(:,end);
rank_ok = (rank(A) == n);

if rank_ok == 0
    warning('Rang incomplet: rank(A) = %d, n = %d', rank(A), n);
end

x = pinv(A) * b;  % pseudo-invers? pentru stabilitate
err = norm(A*x - b)/norm(b);

fprintf('LSC calculat: x = [%s], err = %.4f\n', num2str(x'), err);
end
