addpath('functions')
# f(x) = 2(x_1)^2 + 3(x_2)^2 + x_1x_2 + 2x_1 + 3x_2 +4
A = [2 -1/2;-1/2 3];
b = [-2/2,-3/2]';
c = 4;
x = gradpasfix(A,b,c,[0,0]',0.001,0.0000001);
norm(A*x-b)

[x1, x2] = meshgrid(-3:0.1:3, -3:0.1:3);

% Functia f(x1,x2)
f = 2*x1.^2 + 3*x2.^2 + x1.*x2 + 2*x1 + 3*x2 + 4;

figure

% Subplot 1: suprafata 3D
subplot(1,2,1)
surf(x1, x2, f)
xlabel('x_1')
ylabel('x_2')
zlabel('f(x)')
title('Suprafata f(x_1,x_2)')
shading interp
grid on

% Subplot 2: curbe de nivel
subplot(1,2,2)
contour(x1, x2, f, 20)
hold on
plot(x(1), x(2), 'r*', 'MarkerSize', 10)
xlabel('x_1')
ylabel('x_2')
title('Curbe de nivel si minim')
grid on
