addpath('functions')

% f(x)=2x1^2+3x2^2+x1x2+2x1+3x2+4
A = [2  1/2;
     1/2  3];
b = [1; 3/2];
c = 4;

x0  = [0;0];
tol = 1e-7;

%% 1. Gradient cu pas fix
t = 0.001;
[x_fix, X_fix] = gradpasfix(A, b, c, x0, t, tol);
fprintf('Pas fix: it=%d, ||Ax+b||=%.2e\n', size(X_fix,2)-1, norm(A*x_fix + b));

%% 2. Gradient cu pas adaptiv (pas optim exact)
[x_ad, X_ad, T_ad] = gradpasadapt(A, b, c, x0, tol);
fprintf('Pas optim: it=%d, ||Ax+b||=%.2e\n', size(X_ad,2)-1, norm(A*x_ad + b));

%% 3. Gradient cu pas adaptiv (backtracking)
[x_bt, X_bt, T_bt] = grad_backtracking(A, b, c, x0, tol);
fprintf('Backtracking: it=%d, ||Ax+b||=%.2e\n', size(X_bt,2)-1, norm(A*x_bt + b));

%% Reprezentare grafica
[x1, x2] = meshgrid(-3:0.05:3, -3:0.05:3);
F = 2*x1.^2 + 3*x2.^2 + x1.*x2 + 2*x1 + 3*x2 + 4;

figure

% Suprafata
subplot(1,2,1)
surf(x1, x2, F)
xlabel('x_1'); ylabel('x_2'); zlabel('f(x)')
title('Suprafata functiei')
shading interp
grid on

% Curbe de nivel + traiectorii
subplot(1,2,2)
contour(x1, x2, F, 25)
hold on
plot(X_fix(1,:), X_fix(2,:), 'r-o', 'LineWidth', 1)
plot(X_ad(1,:),  X_ad(2,:),  'g-^', 'LineWidth', 1)
plot(X_bt(1,:),  X_bt(2,:),  'b-s', 'LineWidth', 1)
plot(x_fix(1), x_fix(2), 'k*', 'MarkerSize', 12)
legend('Curbe nivel','Pas fix','Pas optim','Backtracking','Minim')
xlabel('x_1'); ylabel('x_2')
title('Comparatie metode gradient')
grid on

