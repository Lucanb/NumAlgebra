A = [1 0 -1; 0 1 1; 2 0 1];

[m,n] = size(A);
R = A;
Q = eye(m);
p = min(m,n);

for k = 1:p
    x = R(k:m,k);
    sigma = norm(x);
    if sigma == 0
        continue
    end
    if x(1) >= 0
        alpha = -sigma;
    else
        alpha = sigma;
    end
    e1 = zeros(length(x),1);
    e1(1) = 1;
    v = x - alpha*e1;
    v = v / norm(v);
    Hk = eye(m);
    Hk(k:m,k:m) = eye(length(x)) - 2*(v*v');
    R = Hk*R;
    Q = Q*Hk';
end

disp('Q =');
disp(Q);
disp('R =');
disp(R);
disp('Q*R =');
disp(Q*R);
disp('Q''*Q =');
disp(Q'*Q);

