function x = backward(U,b)
b = b(:);
[m,n] = size(U);
if m ~= n
    error('Matricea nu e patratica')
end
for i = 1:n
    if U(i,i) == 0
        error('Matricea nu este iversabila')
    end
end
if n ~= length(b)
    error('Matricea b nu corespunde matricei U')
end
for i = 2:n
    for j = 1:i-1
        if U(i,j) ~= 0
            error('Matricea nu e superior triunghiulara')
        end
    end
end
x = zeros(n,1);
x(n) = b(n)/U(n,n);
for i = n-1:-1:1
    s = 0;
    for j = i+1:n
        s = s + U(i,j)*x(j);
    end
    x(i) = (b(i)-s)/U(i,i);
end
end
