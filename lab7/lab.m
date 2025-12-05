X = [1 2 2 4 5 6 7 3 1 1 2 5 7 5];
Y = [0 2 2 1 0 2 2 3 5 6 7 6 6 7];
W = [10 50 30 20 80 60 40 70 90 55 35 65 45 100];

S = sum(W);
cx = sum(W .* X) / S;
cy = sum(W .* Y) / S;

dx = X - cx;
dy = Y - cy;
d2 = dx.^2 + dy.^2;

R2 = sum(W .* d2) / S;
R = sqrt(R2);

printf("Center: (%.4f , %.4f)\n", cx, cy);
printf("Radius: %.4f\n", R);

figure;
hold on;
grid on;
axis equal;

sz = 20 + 80 * (W / max(W));
scatter(X, Y, sz, 'filled');

plot(cx, cy, 'rp', 'MarkerSize', 14, 'MarkerFaceColor', 'r');

theta = linspace(0, 2*pi, 400);
x_cerc = cx + R * cos(theta);
y_cerc = cy + R * sin(theta);
plot(x_cerc, y_cerc, 'r-', 'LineWidth', 2);

title('Weighted cities + depot + weighted optimal circle');
legend('Cities', 'Depot', 'Circle');

