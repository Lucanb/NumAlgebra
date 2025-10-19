function x = forward(L, b)
b = b(:);
[m,n] = size(L);
if m ~= n
    error('Matricea nu e patratica')
end
for i = 1:n
    if L(i,i) == 0
        error('Matricea nu e inversabila')
    end
end
if n ~= length(b)
    error('Matricea b nu corespunde cu L')
end
for i = 1:n
    for j = i+1:n
        if L(i,j) ~= 0
            error('L nu e inferior triunghiulara')
        end
    end
end
x = zeros(n,1);
x(1) = b(1) / L(1,1);
for i = 2:n
    s = 0;
    for j = 1:i-1
        s = s + L(i,j)*x(j);
    end
    x(i) = (b(i)-s)/L(i,i);
end
x = x(:);
end
