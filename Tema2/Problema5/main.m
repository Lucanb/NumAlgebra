base = fileparts(mfilename('fullpath'));
addpath(fullfile(base,'functions'));
rehash;

F = [1;2;3;4;5;6];
x = [0.011;0.021;0.032;0.041;0.051;0.062];

k = EstimeazaK_Hooke(F, x);

disp('k estimat (LS, model F = k*x) [N/m] =');
disp(k);

sse = SSE_Hooke(F, x, k);
disp('SSE = sum (F - k*x)^2 =');
disp(sse);

disp('Reziduuri r = F - k*x:');
disp(F - k*x);

figure;
plot(x, F, 'o'); hold on;
xx = linspace(min(x), max(x), 200)';
plot(xx, k*xx, '-');
grid on;
xlabel('x (m)');
ylabel('F (N)');
title('Hooke: date vs. model LS F = kx');
legend('date', 'fit LS');

