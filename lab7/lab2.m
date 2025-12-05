T = [0 1 2 3 4 5 6 7];
V = [1 3 1 5 4 6 3 5];

lambda = 2;

n = length(V);
L = zeros(n-2, n);
for i = 1:n-2
    L(i, i:i+2) = [1 -2 1];
end

A = eye(n) + lambda * (L' * L);
x = A \ V(:);

printf("lambda = %.4f\n", lambda);
printf("solution x:\n");
disp(x');

figure;
plot(T, V, 'o-','LineWidth',1.5);
hold on;
plot(T, x, 'r-','LineWidth',2);
grid on;
axis tight;
title('Original V and regularized x');
legend('Original V','Smoothed x');

