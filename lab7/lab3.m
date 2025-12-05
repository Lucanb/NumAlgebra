A = [1 -1 0; 0 1 1];

[m,n] = size(A);
k = min(m,n);

Q = zeros(m,k);
R = zeros(k,n);

for i = 1:n
    v = A(:,i);

    for j = 1:min(i-1,k)
        R(j,i) = Q(:,j)' * v;
        v = v - R(j,i) * Q(:,j);
    end

    if i <= k
        R(i,i) = norm(v);
        if R(i,i) ~= 0
            Q(:,i) = v / R(i,i);
        else
            Q(:,i) = zeros(m,1);
        end
    end
end

disp('Q =');
disp(Q);

disp('R =');
disp(R);

disp('Q*R =');
disp(Q*R);

disp('Q''*Q =');
disp(Q'*Q);

