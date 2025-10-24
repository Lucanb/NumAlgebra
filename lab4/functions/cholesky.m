function H = cholesky(A)
[m,n] = size(A);
H = zeros(n);
H(1,1) = sqrt(A(1,1));
for i = 2:n
    for j = 1:i-1
        s = 0;
        for k = 1:j-1
            s = s + H(i,k)*H(j,k);
        end
        H(i,j) = (A(i,j) - s)/H(j,j);
    end
    s2 = 0;
    for k = 1:i-1
        s2 = s2 + H(i,k)^2;
    end
    H(i,i) = sqrt(A(i,i) - s2);
end
end