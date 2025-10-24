function H = cholesky_scalarp(A)
[m,n] = size(A);
H = zeros(n);
for i = 1:n
    for j = 1:i
        if j == i
            H(i,i) = sqrt(A(i,i) - H(i,1:i-1)*H(i,1:i-1)');
        else
            H(i,j) = (A(i,j) - H(i,1:j-1)*H(j,1:j-1)')/H(j,j);
        end
    end
end
end